import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pregunta_OpcionList } from 'src/app/model/SalaModel';
import { PreguntaService } from 'src/app/services/pregunta.service';
import { SelectItem } from 'primeng/api';


@Component({
  selector: 'app-editar-pregunta',
  templateUrl: './editar-pregunta.component.html',
  styleUrls: ['./editar-pregunta.component.css'],
})
export class EditarPreguntaComponent implements OnInit {

  items: SelectItem[]=[];    
  selectedItem: string | undefined;

  type: string = '';
  //imageSala: string = '';
  titulo: string = '';

  existeError: boolean = false;
  result: string = '';
  auxIdPregunta: number = 0;

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
      // Opcion A
      {
        idOpcion: 0,
        nombre: '',
        correcta: 0,
        estado: 0,
        fecha_creacion: '',
        fecha_modificacion: '',
      },
      // Opcion B
      {
        idOpcion: 0,
        nombre: '',
        correcta: 0,
        estado: 0,
        fecha_creacion: '',
        fecha_modificacion: '',
      },
      // Opcion C
      {
        idOpcion: 0,
        nombre: '',
        correcta: 0,
        estado: 0,
        fecha_creacion: '',
        fecha_modificacion: '',
      },
      // Opcion D
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
  ) {

    this.items = [];
    this.items.push({ label: "2", value: 2 });
    this.items.push({ label: "3", value: 3 });
    this.items.push({ label: "4", value: 4 });
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
    //this.quitarOpcionesVacias();
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
        console.log(resultOpcion, resultPregunta);
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
          //console.log(info, campo);
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

  editarPregunta() {}

  /* quitarOpcionesVacias(){
    this.pregutaOpciones.opcionList.forEach(element => {
      if(element.nombre === ''){
        
      }            
    });
  } */

  opcionCorrecta(event: Event) {
    const valorSeleccionado = (event.target as HTMLInputElement).value;
    this.pregutaOpciones.opcionList.forEach((element) => {
      element.correcta = 0;
    });
    switch (valorSeleccionado) {
      case 'A': {
        this.pregutaOpciones.opcionList[0].correcta = 1;
        break;
      }
      case 'B': {
        this.pregutaOpciones.opcionList[1].correcta = 1;
        break;
      }
      case 'C': {
        this.pregutaOpciones.opcionList[2].correcta = 1;
        break;
      }
      case 'D': {
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
}
