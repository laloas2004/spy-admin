import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { BehaviorSubject, Observable } from 'rxjs';
import { AlertService } from './alert.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private userSubject!: BehaviorSubject<any>;
  public user!: Observable<any>;

  constructor(
    private router: Router,
    private http: HttpClient,
    private alertService: AlertService) {
      
    let user_storage = JSON.parse(String(localStorage.getItem('user')));

    this.userSubject = new BehaviorSubject(user_storage);
    this.user = this.userSubject.asObservable();
  }

  public get currentUserValue(): any {
    return this.userSubject.value;
  }

  public isAuth(): boolean {

    return this.userSubject.value == null ? false : true;

  }

  public getToken() {

    return this.userSubject.value.token;

  }


  public login(email: any, password: any) {

    return new Promise((resolve, reject) => {

      this.http.post(`${environment.auth_url}/auth/login/`, { email: email, password: password }).subscribe((response: any) => {

        localStorage.setItem('user', JSON.stringify(response));

        this.userSubject.next(response);

        return resolve(response);

      }, (err) => {

        if (err.status == 400) {

          return this.alertService.error('Error al ingresar', err.error.non_field_errors[0]);

        }

        this.alertService.error('Error', err.message);



        return reject(err)

      });
    });

  }

  public logout() {

    localStorage.removeItem('user');
    this.userSubject.next(null);
    this.router.navigate(['/login']);
  }

  public register(user: any) {
    return this.http.post(`${environment.auth_url}/users/register`, user);
  }
}