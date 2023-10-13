import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pregunta_OpcionList } from 'src/app/model/SalaModel';
import { PreguntaService } from 'src/app/services/pregunta.service';

@Component({
  selector: 'app-entrada-sala',
  templateUrl: './entrada-sala.component.html',
  styleUrls: ['./entrada-sala.component.css'],
})
export class EntradaSalaComponent implements OnInit {
  numVentana: number = 1;
  idSala: number = 0;
  errorDataResult: number = 0;
  preList_opcList: Pregunta_OpcionList[] = [];

  constructor(
    private preguntaServicio: PreguntaService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    this.numVentana = 1;
  }

  cambiarnumVentana(nuevoValor: number) {
    console.log('Entro');
    console.log(nuevoValor);

    this.numVentana = nuevoValor;
  }

  ngOnInit() {
    this.route.queryParams.subscribe((params) => {
      this.idSala = params['idSala'];
    });
    this.dataPregListOpcList(this.idSala);
  }

  dataPregListOpcList(idSala: number) {
    this.preguntaServicio.PregListOpList(1, idSala).subscribe({
      next: (data: any) => {
        const { error, list } = data.result;
        console.log(data);
        this.errorDataResult = error;
        this.preList_opcList = list;
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }
}
