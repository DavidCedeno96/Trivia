import {
  Component,
  AfterViewInit,
  ViewChild,
  ElementRef,
  ChangeDetectorRef,
  AfterContentChecked,
  OnInit,
} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { MessageService } from 'primeng/api';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { PuntosJugador } from 'src/app/model/PuntosJugador';
import { UsuarioSalaService } from 'src/app/services/usuario-sala.service';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-ranking-challenger',
  templateUrl: './ranking-challenger.component.html',
  styleUrls: ['./ranking-challenger.component.css'],
  providers: [MessageService],
})
export class RankingChallengerComponent
  implements AfterViewInit, AfterContentChecked, OnInit
{
  @ViewChild('scrollableList') scrollableList: ElementRef = new ElementRef(
    null
  );

  existeError: boolean = false;
  result: string = '';
  idSala: number = 0;
  idRol: number = 0;

  miListadeColores: any[] = [];
  nombreJugador: string = 'Roberto Sol';
  testIniciales: string = '';
  numJugadores: number = 0;
  //Lista auxiliar para los jugadores
  listaJugadores: PuntosJugador[] = [
    {
      idUsuario: 0,
      iniciales: 'PP',
      usuario: 'Prueba prueba',
      rol: '',
      idSala: 0,
      sala: '',
      puntaje: 23,
      tiempo: 0,
      fecha_creacion: '',
      fecha_modificacion: '',
    },
  ];

  constructor(
    private cd: ChangeDetectorRef,
    private usuarioSalaService: UsuarioSalaService,
    private usuarioService: UsuarioService,
    private router: Router,
    private route: ActivatedRoute,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService,
    private messageService: MessageService
  ) {
    //this.testIniciales = this.obtenerIniciales(this.nombreJugador);
    // this.cd.detectChanges();
  }

  ngOnInit(): void {
    this.constantsService.loading(true);

    this.route.queryParams.subscribe((params) => {
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '') {
        history.back();
      }
      this.idSala = parseInt(idSala);
    });

    this.idRol = parseInt(this.usuarioService.getRol()!);

    this.getRankingList(this.idSala);
  }

  ngAfterViewInit() {
    const playerToFocus = this.listaJugadores.findIndex(
      (jugador) => jugador.usuario === this.nombreJugador
    );

    if (playerToFocus !== -1) {
      // Calcula la posición de desplazamiento para que el jugador específico esté visible
      const listItemHeight = 48; // Altura estimada de cada elemento de la lista
      const scrollToPosition = playerToFocus * listItemHeight;

      // Ajusta el desplazamiento de la lista
      this.scrollableList.nativeElement.scrollTop = scrollToPosition;
    }
  }

  ngAfterContentChecked(): void {}

  refrescarRanking() {
    this.constantsService.loading(true);
    this.getRankingList(this.idSala);
  }

  getRankingList(idSala: number) {
    this.usuarioSalaService.listBySalaRanking(1, idSala).subscribe({
      next: (data: any) => {
        let { error, info, lista } = data.result;
        this.result = info;
        if (error > 0) {
          this.existeError = true;
        } else {
          this.existeError = false;
          //console.log(lista);
          this.listaJugadores = lista;
          this.listaJugadores.forEach((element) => {
            element.iniciales = this.obtenerIniciales(element.usuario);
          });
        }
        this.numJugadores = this.listaJugadores.length;
        this.constantsService.loading(false);
        for (let i = 0; i < this.listaJugadores.length; i++) {
          this.miListadeColores.push(this.generarColorAleatorio());
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  descargarRanking() {
    this.constantsService.loading(true);
    this.usuarioSalaService.reporteRankingById(0, this.idSala).subscribe({
      next: (data: any) => {
        let { info, error } = data.result;
        this.result = info;
        if (error > 0) {
          this.existeError = true;
        } else {
          this.existeError = false;

          let url = this.usuarioSalaService.getUrlArchivo(info);

          const element = document.createElement('a');
          element.download = `Ranking.xls`;
          element.href = url;
          element.click();

          this.messageService.add({
            severity: 'success',
            summary: this.constantsService.mensajeSatisfactorio(),
            detail: 'La descarga del reporte ha comenzado',
          });
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  obtenerIniciales(nombre: string) {
    // Divide el nombre en palabras utilizando espacio como separador
    const palabras = nombre.split(' ');

    // Verifica si hay al menos una palabra en el nombre
    if (palabras.length >= 1) {
      // Inicializa una variable para almacenar las iniciales
      let iniciales = '';
      if (palabras.length > 1) {
        // Recorre las palabras y obtiene las iniciales de las dos primeras
        for (let i = 0; i < Math.min(palabras.length, 2); i++) {
          const palabra = palabras[i];
          if (palabra.length > 0) {
            iniciales += palabra[0].toUpperCase();
          }
        }
      } else {
        for (let i = 0; i < palabras.length; i++) {
          const palabra = palabras[i];
          if (palabra.length > 0) {
            iniciales += palabra[0].toUpperCase();
          }
        }
      }
      return iniciales;
    } else {
      // En caso de que el nombre esté vacío o no contenga palabras
      return '';
    }
  }

  generarColorAleatorio() {
    const hMin = 29; // Valor mínimo de tono (H)
    const hMax = 50; // Valor máximo de tono (H)
    const sMin = 50; // Valor mínimo de saturación (S)
    const sMax = 100; // Valor máximo de saturación (S)
    const lMin = 40; // Valor mínimo de luminosidad (L)
    const lMax = 70; // Valor máximo de luminosidad (L)

    const h = Math.floor(Math.random() * (hMax - hMin + 1) + hMin);
    const s = Math.floor(Math.random() * (sMax - sMin + 1) + sMin);
    const l = Math.floor(Math.random() * (lMax - lMin + 1) + lMin);

    return `hsl(${h}, ${s}%, ${l}%)`;
  }

  salir() {
    //this.usuarioService.logout();
    const rol = this.usuarioService.getRol();
    if (rol == '1' || rol == '3') {
      this.router.navigate(['/Administrador']);
    }
    if (rol == '2') {
      //this.router.navigate(['/MisSalas']);
      let idSala = this.encryptionService.encrypt(this.idSala.toString());
      let params = { idSala };
      this.router.navigate(['/EntradaSala'], { queryParams: params }); 
      //this.router.navigate(['/MisSalas']);
    }
  }
}
