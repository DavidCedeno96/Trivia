import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pregunta_OpcionList } from 'src/app/model/SalaModel';
import { PreguntaService } from 'src/app/services/pregunta.service';

@Component({
  selector: 'app-editar-pregunta',
  templateUrl: './editar-pregunta.component.html',
  styleUrls: ['./editar-pregunta.component.css'],
})
export class EditarPreguntaComponent implements OnInit {
  type: string = '';
  //imageSala: string = '';
  titulo: string = '';

  pregutaOpciones: Pregunta_OpcionList = {
    pregunta: {
      idPregunta: 0,
      nombre: '',
      idSala: 0,
      estado: 0,
      fecha_creacion: '',
      fecha_modificacion: '',
    },
    opcionList: [
      {
        idOpcion: 0,
        nombre: '',
        correcta: 0,
        estado: 0,
        fecha_creacion: '',
        fecha_modificacion: '',
      },
    ],
  };

  constructor(
    private preguntaServicio: PreguntaService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.type = params['type'];
      this.pregutaOpciones.pregunta.idSala = params['idSala'];
    });
  }

  UpsertSala() {
    console.log(this.pregutaOpciones);
  }
}
