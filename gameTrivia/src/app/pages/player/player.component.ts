import { Component } from '@angular/core';
import { Sala } from 'src/app/model/SalaModel';

@Component({
  selector: 'app-player',
  templateUrl: './player.component.html',
  styleUrls: ['./player.component.css'],
})
export class PlayerComponent {
  misSalas: Sala[] = [
    {
      idSala: 1,
      nombre: 'Mi primera sala',
      imagen: 'assets/Imagenes Juego/Imagen test.png',
      descripcion: 'Descripcion Sala',
      idModoJuego: 0,
      modoJuego: 'Challenger',
      estado: 1,
      fecha_creacion: '',
      fecha_modificacion: '',
    },
    {
      idSala: 2,
      nombre: 'Mi segunda sala',
      imagen: 'assets/Imagenes Juego/Imagen test.png',
      descripcion: 'Descripcion Sala',
      idModoJuego: 0,
      modoJuego: 'Challenger',
      estado: 1,
      fecha_creacion: '',
      fecha_modificacion: '',
    },
  ];
}
