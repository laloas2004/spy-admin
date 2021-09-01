import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AlertService } from 'src/app/services/alert.service';
import { ApiService } from 'src/app/services/api.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-missions-create',
  templateUrl: './missions-create.component.html',
  styleUrls: ['./missions-create.component.css']
})
export class MissionsCreateComponent implements OnInit {

  public currentUser: any;
  public hit: any = [];
  public id!: number;
  private sub: any;
  public status_hit: Array<any> = [];
  public form!: FormGroup;
  public status_selected: any = [];
  public assignee_list: Array<any> = [];
  public submitted = false;


  constructor(private formBuilder: FormBuilder,
    private authenticationService: AuthService,
    public api: ApiService,
    private alertService: AlertService,
    private route: ActivatedRoute,
    private router: Router) {

    this.authenticationService.user.subscribe(x => this.currentUser = x);

  }



  get f() { return this.form.controls; }

  ngOnInit(): void {

    this.form = this.formBuilder.group({
      hitman: [{ value: null, disabled: false }, [Validators.required]],
      description: [{ value: '', disabled: false }, Validators.required],
      target: [{ value: '', disabled: false }, Validators.required],
      status: [{ value: '1', disabled: true }, Validators.required],
      date: [{ value: '2021-09-01', disabled: false }, Validators.required],

    });

    if (this.currentUser.user_id != 1) {

      if (this.currentUser.rol == '1') {

        this.alertService.info('Sin Permisos', 'No tiene autorizacion para entrar a esta vista');


        this.router.navigate(['/']);


      }
    }

    this.api.GET(`/hitman/assignees`, []).then((response: any) => {

      this.assignee_list = response;

    }, (err) => {

      this.alertService.error('Error', err);

    });

    this.api.GET(`/hits/status`, []).then((response: any) => {

      this.status_hit = response;

    }, (err) => {

      this.alertService.error('Error', err);

    });



  }

  public onSubmit(form: any) {


    this.submitted = true;

    if (form.status == "INVALID") {

      this.alertService.info('Formulario incompleto', 'Favor de revisar todos los campos y vuelve a intentar.');
      return;

    }

    debugger;

    if (!form.value.status) { form.value.status = '1' }

    this.api.POST(`/hits/`, form.value).then((response: any) => {

      this.alertService.success('Create', 'Se creo Hit con Exito!');
      this.router.navigate([`/`], { queryParams: {} });

    }, (err) => {

      this.alertService.error('Error', err);
    })


  }

}
