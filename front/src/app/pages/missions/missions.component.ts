import { Component, ElementRef, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import { Subject } from 'rxjs';
import { DataTableDirective } from 'angular-datatables';
import { ActivatedRoute, NavigationBehaviorOptions, Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-missions',
  templateUrl: './missions.component.html',
  styleUrls: ['./missions.component.css']
})
export class MissionsComponent implements OnInit, OnDestroy {

  @ViewChild(DataTableDirective, { static: false })
  datatableElement: any = DataTableDirective;

  public items: Array<any> = []

  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject<any>();

  public show_btn_crear: boolean = false;

  public currentUser: any;


  constructor(
    public api: ApiService,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthService) {

    this.authenticationService.user.subscribe(x => this.currentUser = x);

  }


  ngOnDestroy(): void {

    this.dtTrigger.unsubscribe();
  }

  ngOnInit(): void {

    if (this.currentUser.rol == '2' || this.currentUser.user_id == 1) {
      this.show_btn_crear = true;
    }

    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 5,
      lengthMenu: [5, 10, 25],
      processing: true
    };

    this.api.GET('/hits/', []).then((response: any) => {

      this.items = response;

    }).catch((err) => { });


  }


  public detalle(item: any) {

    this.router.navigate([`/hits/${item.id}`], { queryParams: {} });

  }

  public editar(item: any) {

    this.router.navigate([`/hits/edit/${item.id}`], { queryParams: {} });


  }

  public crearHit() {

    this.router.navigate(['/hits/create/'], { queryParams: {} });

  }

}
