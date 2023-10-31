import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, CanActivate, Router } from '@angular/router';
import { EncryptionService } from 'src/app/encryption.service';
import { SalaJuego } from 'src/app/model/SalaModel';
import { SalaJuegoService } from 'src/app/services/sala-juego.service';

const preventBackNavigation = true;

@Component({
  selector: 'app-survivor-personal-result',
  templateUrl: './survivor-personal-result.component.html',
  styleUrls: ['./survivor-personal-result.component.css'],
})
export class SurvivorPersonalResultComponent implements OnInit, CanActivate {
  private mainTimerInterval: any;
  public seconds: number = 3;
  finTemporizador: boolean = false;

  error: boolean = false;
  info: string = '';

  idSala: number = 0;
  idUsuario: number = 0;

  InicialesJugador: string = 'CMI';
  NombreJugador: string = '';
  Posicion: number = 0;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private encryptionService: EncryptionService,
    private salaJuegoService: SalaJuegoService
  ) {
    window.onpopstate = () => {
      this.router.navigate(['/MisSalas']); // Aquí puedes realizar la acción que deseas al bloquear el evento de volver atrás.      // Por ejemplo, puedes redirigir al usuario a una página específica:      // window.location.href = '/pagina-de-destino';      // O puedes mostrar un mensaje de advertencia.
    };
  }

  ngOnInit() {
    this.route.queryParams.subscribe((params) => {
      let idSala = this.encryptionService.decrypt(params['idSala']);
      let idUsuario = this.encryptionService.decrypt(params['idUsuario']);
      if (idSala === '' || idUsuario === '') {
        history.back();
      }
      this.idUsuario = parseInt(idUsuario);
      this.idSala = parseInt(idSala);
    });

    this.getInfoResultJugador(this.idSala, this.idUsuario);

    this.mainTimerInterval = setInterval(() => {
      if (this.seconds > 0) {
        this.seconds--;
      } else {
        this.finTemporizador = true;
        clearInterval(this.mainTimerInterval);
        // Aquí puedes agregar una acción personalizada cuando el temporizador haya finalizado.
      }
    }, 1000);
  }

  canActivate(): boolean {
    if (preventBackNavigation) {
      // Redirige al usuario a una página específica en lugar de permitir la navegación hacia atrás.
      this.router.navigate(['/MisSalas']);
      return false;
    }
    return true;
  }

  getInfoResultJugador(idSala: number, idJugador: number) {
    this.salaJuegoService.getListByIds(idSala, idJugador).subscribe({
      next: (data: any) => {
        let { info, error, lista } = data.result;
        this.info = info;
        if (error > 0) {
          this.error = true;
        } else {
          this.error = false;
          let listSalaJuego: SalaJuego[] = lista;

          let salaJuegoItem: SalaJuego = listSalaJuego.find(function (element) {
            return element.idSala === idSala && element.idJugador === idJugador;
          })!;

          this.InicialesJugador = salaJuegoItem.iniciales;
          this.Posicion = listSalaJuego.indexOf(salaJuegoItem) + 1;
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  ngOnDestroy() {
    if (this.mainTimerInterval) {
      clearInterval(this.mainTimerInterval);
    }
  }
}
