import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AlertService } from 'src/app/services/alert.service';
import { ApiService } from 'src/app/services/api.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-missions-detail',
  templateUrl: './missions-detail.component.html',
  styleUrls: ['./missions-detail.component.css']
})
export class MissionsDetailComponent implements OnInit {

  public hit: any = [];
  public id!: number;
  private sub: any;
  public status_hit: Array<any> = [];
  public form!: FormGroup;
  public status_selected: any = [];
  public currentUser: any;
  public assignee_list: Array<any> = [];


  constructor(private formBuilder: FormBuilder,
    public api: ApiService,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthService,
    private alertService: AlertService) {

    this.authenticationService.user.subscribe(x => this.currentUser = x);

  }

  ngOnInit(): void {

    this.api.GET(`/hitman/assignees`, []).then((response: any) => {

      debugger

      this.assignee_list = response;

    }, (err) => {

      this.alertService.error('Error', err);

    });

    this.api.GET(`/hits/status`, []).then((response: any) => {

      this.status_hit = response;

    }, (err) => {

      this.alertService.error('Error', err);

    });


    this.sub = this.route.params.subscribe(params => {

      this.id = +params['id'];

      this.api.GET(`/hits/${this.id}/`, []).then((response: any) => {

        this.hit = response;

        this.setDataForm();

      }, (err) => {

        this.alertService.error('Error', err);

      });


    });

    this.form = this.formBuilder.group({
      hitman: [{ value: '', disabled: true }, [Validators.required]],
      description: [{ value: '', disabled: true }, Validators.required],
      target: [{ value: '', disabled: true }, Validators.required],
      status: [{ value: '', disabled: true }, Validators.required],
      createdBy: [{ value: '', disabled: true }, Validators.required],

    });



  }

  public setDataForm() {

    this.form.controls.hitman.setValue(this.hit.hitman.id);
    this.form.controls.description.setValue(this.hit.description);
    this.form.controls.target.setValue(this.hit.target);
    this.form.controls.status.setValue(this.hit.status);
    this.form.controls.createdBy.setValue(this.hit.created_by?.email || 'No Data');

    this.setAssigneePermission();
    this.setStatusPermission();


  }

  public setStatusPermission() {

    switch (this.hit.status) {

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

  public setAssigneePermission() {

    switch (this.hit.status) {

      case "1": {

        if (this.currentUser.rol != "1") {
          this.form.controls.hitman.enable();
        }
        if (this.currentUser.user_id == "1") {
          this.form.controls.hitman.enable();
        }

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

  public onSubmit(form: any) {


    this.api.PATCH(`/hits/${this.id}/`, form.value).then((response: any) => {

      debugger;

      this.alertService.success('Update', 'Se actualizo Hit con Exito!');
      this.router.navigate([`/`], { queryParams: {} });

    }, (err) => {

      this.alertService.error('Error', err);
    })


  }

}
