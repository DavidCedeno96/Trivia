import { Component } from '@angular/core';

@Component({
  selector: 'app-entrada-sala',
  templateUrl: './entrada-sala.component.html',
  styleUrls: ['./entrada-sala.component.css']
})
export class EntradaSalaComponent {
  numVentana: number = 1;

  constructor(){
    this.numVentana = 1;
  }

  cambiarnumVentana(nuevoValor: number) {
    console.log("Entro");
    console.log(nuevoValor);

    this.numVentana = nuevoValor;
  }
  

}
