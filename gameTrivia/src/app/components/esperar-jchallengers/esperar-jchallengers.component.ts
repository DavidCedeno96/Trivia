import { Component } from '@angular/core';
import { PuntosJugador } from 'src/app/model/PuntosJugador';

@Component({
  selector: 'app-esperar-jchallengers',
  templateUrl: './esperar-jchallengers.component.html',
  styleUrls: ['./esperar-jchallengers.component.css']
})
export class EsperarJChallengersComponent {
  testname:string="Carlos";
  testIniciales:string = "";
  numJugadores:number = 0;
  tamanoSala: number = 40;
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
      {iniciales: "",  
      jugador: "",
      puntos: 0, },
      
      
  ];

  constructor(){
    this.testIniciales=this.obtenerIniciales(this.testname);
    this.numJugadores=this.listaJugadores.length;

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

}
