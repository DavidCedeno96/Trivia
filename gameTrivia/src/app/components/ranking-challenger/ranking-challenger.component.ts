import { Component, AfterViewInit, ViewChild, ElementRef } from '@angular/core';
import { PuntosJugador } from 'src/app/model/PuntosJugador';

@Component({
  selector: 'app-ranking-challenger',
  templateUrl: './ranking-challenger.component.html',
  styleUrls: ['./ranking-challenger.component.css']
})
export class RankingChallengerComponent implements AfterViewInit {

  @ViewChild('scrollableList') scrollableList: ElementRef = new ElementRef(null);


  nombreJugador:string="Roberto Sol";
  testIniciales:string = "";
  numJugadores:number = 0;
//Lista auxiliar para los jugadores
  listaJugadores: PuntosJugador[]=[
    {iniciales: "CI",  
      jugador: "Carlos Icaza",
      puntos: 23, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },      
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      {iniciales: "RS",  
      jugador: "Roberto Sol",
      puntos: 0, },     
      
  ];

  constructor(){
    this.testIniciales=this.obtenerIniciales(this.nombreJugador);
    this.numJugadores=this.listaJugadores.length;
  }

  ngAfterViewInit() {
    const playerToFocus = this.listaJugadores.findIndex(jugador => jugador.jugador === this.nombreJugador);
  
    if (playerToFocus !== -1) {
      // Calcula la posición de desplazamiento para que el jugador específico esté visible
      const listItemHeight = 48; // Altura estimada de cada elemento de la lista
      const scrollToPosition = playerToFocus * listItemHeight;
  
      // Ajusta el desplazamiento de la lista
      this.scrollableList.nativeElement.scrollTop = scrollToPosition;
    }
  }


  obtenerIniciales(nombre:string) {
    // Divide el nombre en palabras utilizando espacio como separador
    const palabras = nombre.split(' ');
  
    // Verifica si hay al menos una palabra en el nombre
    if (palabras.length >= 1) {
      // Inicializa una variable para almacenar las iniciales
      let iniciales = '';
      if(palabras.length>1){
        // Recorre las palabras y obtiene las iniciales de las dos primeras
        for (let i = 0; i < Math.min(palabras.length, 2); i++) {
          const palabra = palabras[i];
          if (palabra.length > 0) {
            iniciales += palabra[0].toUpperCase();
          }
        }    

      }else{
        for (let i = 0; i < palabras.length; i++) {
          const palabra = palabras[i];
          if (palabra.length > 0) {
            iniciales += palabra[0].toUpperCase();
          }
        }

      }
      return iniciales;
  
      
    }else{
      // En caso de que el nombre esté vacío o no contenga palabras
    return '';

    }
  
    
  }

  generarColorAleatorio() {
    const hMin = 29;    // Valor mínimo de tono (H)
  const hMax = 50;    // Valor máximo de tono (H)
  const sMin = 50;    // Valor mínimo de saturación (S)
  const sMax = 100;   // Valor máximo de saturación (S)
  const lMin = 40;    // Valor mínimo de luminosidad (L)
  const lMax = 70;    // Valor máximo de luminosidad (L)

  const h = Math.floor(Math.random() * (hMax - hMin + 1) + hMin);
  const s = Math.floor(Math.random() * (sMax - sMin + 1) + sMin);
  const l = Math.floor(Math.random() * (lMax - lMin + 1) + lMin);

  return `hsl(${h}, ${s}%, ${l}%)`;


  }

}
