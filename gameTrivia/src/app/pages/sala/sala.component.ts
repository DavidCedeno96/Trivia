import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pregunta, Sala } from 'src/app/model/SalaModel';
import { PreguntaService } from 'src/app/services/pregunta.service';
import { SalaService } from 'src/app/services/sala.service';

@Component({
  selector: 'app-sala',
  templateUrl: './sala.component.html',
  styleUrls: ['./sala.component.css'],
})
export class SalaComponent implements OnInit {
  existeError: boolean = false;
  result: string = '';

  existeErrorPregunta: boolean = false;
  resultPregunta: string = '';

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
    private route: ActivatedRoute
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

  //  const salaEncontrada = salas.find((sala) => sala.idSala === idSala);
}
