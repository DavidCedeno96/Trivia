import { Component, EventEmitter, Output } from '@angular/core';
import { LoginUsuario } from 'src/app/model/LoginModel';
import { UsuarioService } from 'src/app/services/usuario.service';

import { JwtHelperService } from '@auth0/angular-jwt';

import { Router } from '@angular/router';

@Component({
  selector: 'app-ventana-login',
  templateUrl: './ventana-login.component.html',
  styleUrls: ['./ventana-login.component.css'],
})
export class VentanaLoginComponent {
  @Output() isLoginH = new EventEmitter<boolean>();

  helper = new JwtHelperService();

  //Inputs
  loginUsuario: LoginUsuario = {
    correo: '',
    contrasena: '',
  };

  existeError: boolean = false;

  constructor(
    private usuarioServicio: UsuarioService,
    private router: Router
  ) {}

  onSubmit() {
    this.usuarioServicio.loginUsuario(this.loginUsuario).subscribe({
      next: (data: any) => {
        const { info, error } = data.result;
        //this.respuesta = data.result;
        //console.log(info, error);

        if (error > 0) {
          // hay error
          this.existeError = true;
        } else {
          // no hay error
          const decodeToken = this.helper.decodeToken(info);
          //console.log(decodeToken);
          let { correo, idRol, nombre } = decodeToken;
          localStorage.setItem('token', info);
          localStorage.setItem('rol', idRol);
          //Ruta para el jugador

          if (idRol == 2) {
            this.router.navigate(['/MisSalas']);
          }
          //Ruta para el administrador
          if (idRol == 1) {
            this.router.navigate(['/Administrador']);
          }
        }
      },
      error: (e) => {
        console.log(e);
      },
    });
  }

  /* getDecodedAccessToken(token: string): any {
    try {
      return jwt_decode(token);
    } catch(Error) {
      return null;
    }
  } */

  // Método para cambiar el valor del booleano y emitir el evento
  onClickCambiar() {
    this.isLoginH.emit(false); // Puedes emitir 'true' o 'false' según tu lógica
  }
}
