import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HitmanComponent } from './pages/hitman/hitman.component';
import { HitmenDetailComponent } from './pages/hitmen-detail/hitmen-detail.component';
import { MissionsComponent } from './pages/missions/missions.component';
import { MissionsDetailComponent } from './pages/missions-detail/missions-detail.component';
import { MissionsCreateComponent } from './pages/missions-create/missions-create.component';
import { ErrorsComponent } from './pages/errors/errors.component';
import { LoginComponent } from './auth/login/login.component';
import { LogoutComponent } from './auth/logout/logout.component';
import { RegisterComponent } from './auth/register/register.component';

import { FullComponent } from './layouts/full/full.component';
import { AuthComponent } from './layouts/auth/auth.component';

const routes: Routes = [

  {
    path: '',
    component: FullComponent,
    children: [{
      path: '', redirectTo: '/hits', pathMatch: 'full'
    },
    { path: 'hits', component: MissionsComponent },
    { path: 'hits/create', component: MissionsCreateComponent, pathMatch: 'full' },
    { path: 'hits/:id', component: MissionsDetailComponent },
    { path: 'hitmen', component: HitmanComponent },
    { path: 'hitmen/:id', component: HitmenDetailComponent },

    ]
  }, {
    path: '',
    component: AuthComponent,
    children: [
      { path: 'login', component: LoginComponent },
      { path: 'logout', component: LogoutComponent },
      { path: 'register', component: RegisterComponent }
    ]

  },
  { path: '404', component: ErrorsComponent },
  { path: '**', redirectTo: '404' }


];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    useHash: true,
  })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
