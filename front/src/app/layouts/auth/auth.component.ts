import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.css']
})
export class AuthComponent implements OnInit {

  public currentUser: any;

  constructor(
    private router: Router,
    private authenticationService: AuthService) {

    this.authenticationService.user.subscribe(x => this.currentUser = x);

  }

  ngOnInit(): void {
  }

  logout() {
    this.authenticationService.logout();
    this.router.navigate(['/login']);
  }

}
