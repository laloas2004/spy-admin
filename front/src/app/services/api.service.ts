import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  public API_URL: string = '';

  constructor(private http: HttpClient, public authService: AuthService, private route: Router) {
    this.API_URL = environment.api_url;
  }

  public GET(resource: string, params: Object[]) {

    let auth_token = this.authService.getToken();

    if (!auth_token) { this.route.navigate(['logout'], {}); }

    let token = auth_token;

    let httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + token
      })
    };

    return this.http.get(this.API_URL + resource, httpOptions)
      .toPromise()
      .catch((err) => {

        if (err.status == 401) {
          this.route.navigate(['logout'], {});
        }
      });


  }

  public POST(resource: string, params: Object[]) {

    let auth_token = this.authService.getToken();

    if (!auth_token) { this.route.navigate(['logout'], {}); }

    let token = auth_token;

    let httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + token
      })
    };

    return this.http.post(this.API_URL + resource, params, httpOptions)
      .toPromise()
      .catch((err) => {

        if (err.status == 401) {
          this.route.navigate(['logout'], {});
        }
      });


  }

  public PUT(resource: string, params: Object[]) {

    let auth_token = this.authService.getToken();

    if (!auth_token) { this.route.navigate(['logout'], {}); }

    let token = auth_token;

    let httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + token
      }),
      params: params
    };

    return this.http.put(this.API_URL + resource, httpOptions)
      .toPromise()
      .catch((err) => {

        if (err.status == 401) {
          this.route.navigate(['logout'], {});
        }
      });


  }

  public PATCH(resource: string, params: Object[]) {

    let auth_token = this.authService.getToken();

    if (!auth_token) { this.route.navigate(['logout'], {}); }

    let token = auth_token;

    let httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + token
      })
    };

    return this.http.patch(this.API_URL + resource, params, httpOptions)
      .toPromise()
      .catch((err) => {

        if (err.status == 401) {
          this.route.navigate(['logout'], {});
        }
      });




  }
}
