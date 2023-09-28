import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { RouterModule } from '@angular/router';


//Componentes de Primeng
import { ButtonModule } from 'primeng/button';

//Ventanas creadas
import { VentanaLoginComponent } from './components/ventana-login/ventana-login.component';
import { VentanaRegistroComponent } from './components/ventana-registro/ventana-registro.component';
import { IniciarSesionComponent } from './pages/iniciar-sesion/iniciar-sesion.component';
import { AdminComponent } from './pages/admin/admin.component';
import { CrearSalaComponent } from './pages/crear-sala/crear-sala.component';
import { SalaComponent } from './pages/sala/sala.component';


@NgModule({
  declarations: [
    AppComponent,
    VentanaLoginComponent,
    VentanaRegistroComponent,
    IniciarSesionComponent,
    AdminComponent,
    CrearSalaComponent,
    SalaComponent,    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ButtonModule,
    RouterModule.forRoot([
      {path: 'Iniciar_Sesion', component: IniciarSesionComponent},
      {path: 'Administrador', component: AdminComponent},
      {path: 'CrearSala', component: CrearSalaComponent},
      {path: 'Sala', component: SalaComponent},
      
    ]),

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
