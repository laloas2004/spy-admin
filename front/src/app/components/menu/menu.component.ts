import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  public currentUser: any;

  constructor(private authenticationService: AuthService,) {

    this.authenticationService.user.subscribe(x => this.currentUser = x);

  }

  ngOnInit(): void {
  }

}
