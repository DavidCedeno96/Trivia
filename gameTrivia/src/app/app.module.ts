import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { RouterModule } from '@angular/router';

// Este es para la apiRest
import { HttpClientModule } from '@angular/common/http';

//Componentes de Primeng
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { DialogModule } from 'primeng/dialog';

//Ventanas creadas
import { VentanaLoginComponent } from './components/ventana-login/ventana-login.component';
import { VentanaRegistroComponent } from './components/ventana-registro/ventana-registro.component';
import { IniciarSesionComponent } from './pages/iniciar-sesion/iniciar-sesion.component';
import { AdminComponent } from './pages/admin/admin.component';
import { CrearSalaComponent } from './pages/crear-sala/crear-sala.component';
import { SalaComponent } from './pages/sala/sala.component';
import { EditarPreguntaComponent } from './pages/editar-pregunta/editar-pregunta.component';
import { PlayerComponent } from './pages/player/player.component';

import { FormsModule } from '@angular/forms';
import { IngresarImagenComponent } from './pages/ingresar-imagen/ingresar-imagen.component';

import { NgxDropzoneModule } from 'ngx-dropzone';


@NgModule({
  declarations: [
    AppComponent,
    VentanaLoginComponent,
    VentanaRegistroComponent,
    IniciarSesionComponent,
    AdminComponent,
    CrearSalaComponent,
    SalaComponent,
    EditarPreguntaComponent,
    PlayerComponent,
    IngresarImagenComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ButtonModule,
    DialogModule,
    NgxDropzoneModule,
    ToastModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      {path: 'Iniciar_Sesion', component: IniciarSesionComponent},
      {path: 'Administrador', component: AdminComponent, canActivate:[authGuard]},
      {path: 'CrearSala', component: CrearSalaComponent, canActivate:[authGuard]},
      {path: 'Sala', component: SalaComponent, canActivate:[authGuard]},
      {path: 'Editar_pregunta', component: EditarPreguntaComponent, canActivate:[authGuard]},      
      {path: 'Ingresar_Imagen', component: IngresarImagenComponent, canActivate:[authGuard]},
      {path: 'MisSalas', component: PlayerComponent, canActivate:[authGuard]},
      
      
    ]),

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }import { authGuard } from './auth.guard';

