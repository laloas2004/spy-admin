import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AlertService } from 'src/app/services/alert.service';
import { ApiService } from 'src/app/services/api.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-hitmen-detail',
  templateUrl: './hitmen-detail.component.html',
  styleUrls: ['./hitmen-detail.component.css']
})
export class HitmenDetailComponent implements OnInit {

  sub: any;
  id!: number;
  hitman: any;
  form: any;
  status_hitman: any;

  constructor(private formBuilder: FormBuilder,
    public api: ApiService,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthService,
    private alertService: AlertService) {


  }

  ngOnInit(): void {

    this.api.GET(`/hitman/status`, []).then((response: any) => {

      this.status_hitman = response;

    }, (err) => {

      this.alertService.error('Error', err);

    });

    this.sub = this.route.params.subscribe(params => {

      this.id = +params['id'];

      this.api.GET(`/hitman/${this.id}/`, []).then((response: any) => {

        this.hitman = response;

        this.setDataForm();

      }, (err) => {

        this.alertService.error('Error', err);

      });


    });

    this.form = this.formBuilder.group({
      name: [{ value: '', disabled: true }, [Validators.required]],
      email: [{ value: '', disabled: true }, Validators.required],
      description: [{ value: '', disabled: true }, Validators.required],
      status: [{ value: '', disabled: true }, Validators.required],

    });
  }

  public setDataForm() {

    this.form.controls.name.setValue(this.hitman.name);
    this.form.controls.email.setValue(this.hitman.user.email);
    this.form.controls.description.setValue(this.hitman.description);
    this.form.controls.status.setValue(this.hitman.status);

    this.setStatusPermission();


  }

  public onSubmit(form: any) {


    this.api.PATCH(`/hitman/${this.id}/`, form.value).then((response: any) => {

      this.alertService.success('Update', 'Se actualizo Hitman con Exito!');
      this.router.navigate([`/hitmen`], { queryParams: {} });

    }, (err) => {

      this.alertService.error('Error', err);
    })


  }

  public setStatusPermission() {

    switch (this.hitman.status) {

      case "1": {
        this.form.controls.status.enable();
        break;
      }
      case "2": {
        //statements; 
        break;
      }
      case "3": {
        //statements; 
        break;
      }
      default: {
        //statements; 
        break;
      }
    }


  }

}
