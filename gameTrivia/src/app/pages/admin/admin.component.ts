import { Component } from '@angular/core';
import { Sala } from 'src/app/model/SalaModel';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent {
  misSalas: Sala[] = [
    { idSala: 1,
      nombre: "Mi primera sala",
      imagen: "assets/Imagenes Juego/Imagen test.png",
      descripcion: "Descripcion Sala",
      idModoJuego: "Challenger",
      estado: 1},
    { idSala: 2,
      nombre: "Mi segunda sala",
      imagen: "assets/Imagenes Juego/Imagen test.png",
      descripcion: "Descripcion Sala",
      idModoJuego: "Challenger",
      estado: 1}
  ];
}
