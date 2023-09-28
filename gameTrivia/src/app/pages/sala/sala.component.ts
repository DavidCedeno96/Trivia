import { Component } from '@angular/core';
import { Pregunta, Sala } from 'src/app/model/SalaModel';

@Component({
  selector: 'app-sala',
  templateUrl: './sala.component.html',
  styleUrls: ['./sala.component.css']
})
export class SalaComponent {
  miSala: Sala = { idSala: 1,
    nombre: "Mi primera sala",
    imagen: "assets/Imagenes Juego/Imagen test.png",
    descripcion: "Descripcion Sala",
    idModoJuego: "Challenger",
    estado: 1};

  preguntasSala: Pregunta[] = [
    {idPregunta: 1,
    nombre: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has",
    estado: 1,
    },
    {idPregunta: 2,
      nombre: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has",
      estado: 1,}
      
];

//  const salaEncontrada = salas.find((sala) => sala.idSala === idSala);




}
