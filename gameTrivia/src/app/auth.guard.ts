import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { UsuarioService } from './services/usuario.service';

export const authGuard: CanActivateFn = (route, state) => {
  const usuarioServicio = inject(UsuarioService);
  const router = inject(Router);

  /*  if(usuarioServicio.loggedIn()){
    return true;

  }else{
    return false;
  } */

  if (usuarioServicio.loggedIn()) {
    if (usuarioServicio.getRol() == '1') {
      return true;
    } else if (usuarioServicio.getRol() == '2') {
      return true;
    } else if (usuarioServicio.getRol() == '3') {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
};
