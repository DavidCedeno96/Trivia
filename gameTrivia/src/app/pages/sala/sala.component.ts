import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pregunta, Sala } from 'src/app/model/SalaModel';
import { PreguntaService } from 'src/app/services/pregunta.service';
import { SalaService } from 'src/app/services/sala.service';
import { ConfirmationService, MessageService } from 'primeng/api';

@Component({
  selector: 'app-sala',
  templateUrl: './sala.component.html',
  styleUrls: ['./sala.component.css'],
  providers: [ConfirmationService, MessageService],
})
export class SalaComponent implements OnInit {
  existeError: boolean = false;
  result: string = '';

  existeErrorPregunta: boolean = false;
  resultPregunta: string = '';
  dialogEliminar: boolean = false;

  miSala: Sala = {
    idSala: 1,
    nombre: 'Mi primera sala',
    imagen: 'assets/Imagenes Juego/Imagen test.png',
    descripcion: 'Descripcion Sala',
    idModoJuego: 0,
    modoJuego: 'Challenger',
    estado: 1,
    fecha_creacion: '',
    fecha_modificacion: '',
  };

  preguntasSala: Pregunta[] = [
    {
      idPregunta: 1,
      nombre: '¿Porque deberia escribir Hola mundo?',
      idSala: 1,
      estado: 1,
      fecha_creacion: '',
      fecha_modificacion: '',
    },
  ];

  constructor(
    private salaServicio: SalaService,
    private preguntaServicio: PreguntaService,
    private router: Router,
    private route: ActivatedRoute,
    private confirmationService: ConfirmationService,
    private messageService: MessageService
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.miSala.idSala = params['idSala'];
    });

    this.cargarInfoSala(this.miSala.idSala);
    this.cargarPreguntas(this.miSala.idSala);
  }

  cargarInfoSala(idSala: number) {
    this.salaServicio.itemSala(0, idSala).subscribe({
      next: (data: any) => {
        const { info, error, sala } = data.result;
        this.result = info;
        if (error > 0) {
          //hay error
          this.existeError = true;
        } else {
          //no hay error
          this.existeError = false;
          this.miSala = sala;
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  cargarPreguntas(idSala: number) {
    this.preguntaServicio.listaPreguntaByIdSala(0, idSala).subscribe({
      next: (data: any) => {
        const { info, error, lista } = data.result;
        this.resultPregunta = info;
        if (error > 0) {
          this.existeErrorPregunta = true;
        } else {
          this.existeErrorPregunta = false;
          this.preguntasSala = lista;
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  eliminarPregunta(idPregunta: number) {
    this.preguntaServicio.eliminarPreguntaOpciones(idPregunta).subscribe({
      next: (data: any) => {
        const { info, error } = data.result;
        this.result = info;
        if (error > 0) {
          this.existeError = true;
          this.messageService.add({
            severity: 'error',
            summary: 'Error',
            detail: 'No se pudo eliminar la pregunta',
          });
        } else {
          this.existeError = false;
          this.cargarPreguntas(this.miSala.idSala);
          this.messageService.add({
            severity: 'success',
            summary: 'Satisfactorio',
            detail: 'Pregunta eliminada',
          });
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  confirmEliminar(idPregunta: number) {
    this.confirmationService.confirm({
      message: '¿Seguro desea eliminar la pregunta?',
      header: 'Confirmación Eliminar',
      accept: () => this.eliminarPregunta(idPregunta),
    });
  }

  //  const salaEncontrada = salas.find((sala) => sala.idSala === idSala);
}
