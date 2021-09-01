import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { AlertService } from 'src/app/services/alert.service';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-hitman',
  templateUrl: './hitman.component.html',
  styleUrls: ['./hitman.component.css']
})
export class HitmanComponent implements OnInit {

  @ViewChild(DataTableDirective, { static: false })
  datatableElement: any = DataTableDirective;

  public items: Array<any> = []

  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject<any>();

  constructor(public api: ApiService, private route: ActivatedRoute, private router: Router, private alertService: AlertService) {


  }

  ngOnDestroy(): void {

    this.dtTrigger.unsubscribe();
  }

  ngOnInit(): void {

    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 5,
      lengthMenu: [5, 10, 25],
      processing: true
    };

    this.api.GET('/hitman/', []).then((response: any) => {

      this.items = response;

    }).catch((err) => {

      this.alertService.error('Error', err);
    });


  }

  public detalle(item: any) {

    this.router.navigate([`/hitmen/${item.id}`], { queryParams: {} });

  }

  public editar(item: any) {

    this.router.navigate([`/hits/edit/${item.id}`], { queryParams: {} });


  }

  public crearHit() {

    this.router.navigate(['/hits/create/'], { queryParams: {} });

  }


}
