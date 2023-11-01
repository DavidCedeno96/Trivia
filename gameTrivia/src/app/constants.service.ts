import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioService } from './services/usuario.service';

@Injectable({
  providedIn: 'root',
})
export class ConstantsService {
  private timeoutId!: number;
  private tiempoDeInactividad: number = 480000; // 8 minutos

  constructor(
    private router: Router,
    private usuarioServicio: UsuarioService
  ) {}

  mensajeSatisfactorio(): string {
    return 'Proceso Ejecutado';
  }

  mensajeError(): string {
    return 'Error';
  }

  randomNumber(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1) + min);
  }

  resetTimer() {
    clearTimeout(this.timeoutId);
    this.timeoutId = setTimeout(() => {
      if (this.usuarioServicio.loggedIn()) {
        // Redirigir al usuario a la página de inicio de sesión si está logeado
        console.log('Cerrando sesion por inactividad');
        this.router.navigate(['/Iniciar_Sesion']);
      }
    }, this.tiempoDeInactividad);
  }

  startWatching() {
    console.log(this.tiempoDeInactividad);
    this.resetTimer();
    document.addEventListener('mousemove', () => this.resetTimer());
    document.addEventListener('keydown', () => this.resetTimer());
  }

  loading(visible: boolean) {
    //, none: boolean
    const loading = document.getElementById('loading');
    if (loading) {
      /* if(none){
        loading.classList.add('hidden');
        return;
      } */
      if (visible) {
        loading.classList.remove('hidden');
      } else {
        setTimeout(() => {
          loading.classList.add('hidden');
        }, 300);
      }
    }
  }
}
