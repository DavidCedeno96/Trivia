import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Opcion, Pregunta_OpcionList } from 'src/app/model/SalaModel';
import { PreguntaService } from 'src/app/services/pregunta.service';
//import { SelectItem } from 'primeng/api';

@Component({
  selector: 'app-editar-pregunta',
  templateUrl: './editar-pregunta.component.html',
  styleUrls: ['./editar-pregunta.component.css'],
})
export class EditarPreguntaComponent implements OnInit {
  //items: SelectItem[] = [];
  //selectedItem: string | undefined;

  type: string = '';
  titulo: string = '';

  existeError: boolean = false;
  result: string = '';
  auxIdPregunta: number = 0;
  auxOpcionList: Opcion[] = [];
  opcion: string[] = ['A', 'B', 'C', 'D'];

  pregutaOpciones: Pregunta_OpcionList = {
    pregunta: {
      idPregunta: 0,
      nombre: '',
      idSala: 0,
      estado: 0,
      fecha_creacion: '',
      fecha_modificacion: '',
    },
    opcionList: [],
  };

  constructor(
    private preguntaServicio: PreguntaService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    /* this.items = [];
    this.items.push({ label: '2', value: 2 });
    this.items.push({ label: '3', value: 3 });
    this.items.push({ label: '4', value: 4 }); */
  }

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.type = params['type'];
      this.pregutaOpciones.pregunta.idSala = parseInt(params['idSala']);
      this.auxIdPregunta = parseInt(params['idPregunta']);
    });
    switch (this.type) {
      case 'crear': {
        this.titulo = 'Crear Pregunta';
        this.auxIdPregunta = 0;
        break;
      }
      case 'editar': {
        this.titulo = 'Editar Pregunta';
        this.pregutaOpciones.pregunta.idPregunta = this.auxIdPregunta;
        this.cargarData(this.auxIdPregunta);
        break;
      }
      default: {
        this.titulo = '';
        history.back();
        break;
      }
    }
  }

  UpsertSala() {
    switch (this.type) {
      case 'crear': {
        this.crearNuevaPregunta();
        break;
      }
      case 'editar': {
        this.editarPregunta();
        break;
      }
      default: {
        history.back();
        break;
      }
    }
  }

  cargarData(idPregunta: number) {
    this.preguntaServicio.listaPregOpciones(0, idPregunta).subscribe({
      next: (data: any) => {
        const { resultOpcion, resultPregunta } = data;
        const { lista } = resultOpcion;
        const { pregunta } = resultPregunta;
        if (resultPregunta.error > 0) {
        } else {
          this.pregutaOpciones.pregunta = pregunta;
        }
        if (resultOpcion.error > 0) {
        } else {
          this.pregutaOpciones.opcionList = lista;
          this.auxOpcionList = lista;
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  crearNuevaPregunta() {
    this.preguntaServicio
      .crearPreguntaOpciones(this.pregutaOpciones)
      .subscribe({
        next: (data: any) => {
          const { info, error, campo } = data.result;
          this.result = info;
          if (error > 0) {
            this.result += '_' + campo;
            this.existeError = true;
          } else {
            this.existeError = false;
            history.back();
          }
        },
        error: (e) => {
          if (e.status === 401) {
            this.router.navigate(['/']);
          }
        },
      });
  }

  editarPregunta() {
    this.preguntaServicio
      .editarPreguntaOpciones(this.pregutaOpciones)
      .subscribe({
        next: (data: any) => {
          const { info, error, campo } = data.result;
          this.result = info;
          if (error > 0) {
            this.result += '_' + campo;
            this.existeError = true;
          } else {
            this.existeError = false;
            history.back();
          }
        },
        error: (e) => {
          if (e.status === 401) {
            this.router.navigate(['/']);
          }
        },
      });
  }

  opcionCorrecta(event: Event) {
    const valorSeleccionado = (event.target as HTMLInputElement).value;
    this.pregutaOpciones.opcionList.forEach((element) => {
      element.correcta = 0;
    });
    switch (Number(valorSeleccionado)) {
      case 0: {
        this.pregutaOpciones.opcionList[0].correcta = 1;
        break;
      }
      case 1: {
        this.pregutaOpciones.opcionList[1].correcta = 1;
        break;
      }
      case 2: {
        this.pregutaOpciones.opcionList[2].correcta = 1;
        break;
      }
      case 3: {
        this.pregutaOpciones.opcionList[3].correcta = 1;
        break;
      }
      default: {
        console.log('Opcion Incorrecta');
        history.back();
        break;
      }
    }
  }

  selectTotalOpciones(event: Event) {
    const selectedValue = (event.target as HTMLSelectElement).value;
    switch (Number(selectedValue)) {
      case 2: {
        this.pregutaOpciones.opcionList = this.opcionItem(2);
        break;
      }
      case 3: {
        this.pregutaOpciones.opcionList = this.opcionItem(3);
        break;
      }
      case 4: {
        this.pregutaOpciones.opcionList = this.opcionItem(4);
        break;
      }
      default: {
        this.pregutaOpciones.opcionList = [];
        break;
      }
    }
  }

  opcionItem(num: number): Opcion[] {
    var item = [];
    for (let i = 0; i < num; i++) {
      item.push({
        idOpcion: 0,
        nombre: '',
        correcta: 0,
        estado: 0,
        idPregunta: this.auxIdPregunta,
        fecha_creacion: '',
        fecha_modificacion: '',
      });
      if (this.auxOpcionList.length > 0 && i < this.auxOpcionList.length) {
        item[i] = this.auxOpcionList[i];
      }
    }
    return item;
  }

  totalOpciones() {
    if (this.pregutaOpciones.opcionList.length) {
      return this.pregutaOpciones.opcionList.length - 1;
    }
    return 0;
  }

  atras() {
    history.back();
  }
}
