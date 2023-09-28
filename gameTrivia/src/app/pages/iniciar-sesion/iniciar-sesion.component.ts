import { Component } from '@angular/core';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent {
  isLogin: boolean = true;
  cambiarBoolLogin(nuevoValor: boolean) {
    this.isLogin = nuevoValor;
  }

}
