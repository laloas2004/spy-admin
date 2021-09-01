import { Injectable } from '@angular/core';
import swal from 'sweetalert2';

@Injectable({
  providedIn: 'root'
})
export class AlertService {

  public alert: any;

  public error(title: any = 'Error', error: any = 'Ocurrio un Error!') {

    debugger;

    this.alert = swal.fire(title, error, 'error');

  }
  public info(title: any = 'Informacion', info: any = 'Hay Info!') {

    this.alert = swal.fire(title, info, 'info');

  }
  public success(title: any = 'Proceso Exitoso', info: any = 'Exito!') {

    this.alert = swal.fire(title, info, 'success');

  }
  public clear() {

  }

  constructor() { }
}
