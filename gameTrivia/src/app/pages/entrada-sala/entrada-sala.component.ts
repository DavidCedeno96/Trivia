import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Pregunta_OpcionList } from 'src/app/model/SalaModel';
import { JuegoChallengerService } from 'src/app/services/juego-challenger.service';
import { PreguntaService } from 'src/app/services/pregunta.service';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-entrada-sala',
  templateUrl: './entrada-sala.component.html',
  styleUrls: ['./entrada-sala.component.css'],
})
export class EntradaSalaComponent implements OnInit {
  numVentana: number = 1;
  idSala: number = 0;
  currentIdJugador: number = 0;
  iniciales: string = '';
  errorResultPreOp: number = 0;
  preList_opcList: Pregunta_OpcionList[] = [];

  constructor(
    private preguntaServicio: PreguntaService,
    private router: Router,
    private route: ActivatedRoute,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService,
    private usuarioService: UsuarioService,
    private juegoChallengerService: JuegoChallengerService
  ) {
    this.numVentana = 1;
  }

  cambiarnumVentana(nuevoValor: number) {
    console.log('Entro');
    console.log(nuevoValor);

    this.numVentana = nuevoValor;
  }

  ngOnInit() {
    this.constantsService.loading(true);
    this.currentIdJugador = parseInt(this.usuarioService.getIdUsuario()!);
    this.iniciales = this.obtenerIniciales(this.usuarioService.getUserName()!);
    this.route.queryParams.subscribe((params) => {
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '') {
        history.back();
      }
      this.idSala = parseInt(idSala);
    });
    this.dataPregListOpcList(this.idSala);
  }

  dataPregListOpcList(idSala: number) {
    this.preguntaServicio.PregListOpList(1, idSala).subscribe({
      next: (data: any) => {
        const { error, list } = data.result;
        //console.log(data);
        this.errorResultPreOp = error;
        this.preList_opcList = list;
        this.createPosicion();
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  createPosicion() {
    let juego = {
      idSala: this.idSala,
      idJugador: this.currentIdJugador,
      iniciales: this.iniciales,
      posicion: 0,
    };

    this.juegoChallengerService.createItem(juego).subscribe({
      next: (data: any) => {
        let { error } = data.result;
        return error;
      },
      error: (e) => {
        console.log(e);
        return 1;
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
}
