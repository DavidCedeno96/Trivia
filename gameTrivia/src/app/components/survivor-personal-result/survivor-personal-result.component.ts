import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-survivor-personal-result',
  templateUrl: './survivor-personal-result.component.html',
  styleUrls: ['./survivor-personal-result.component.css']
})
export class SurvivorPersonalResultComponent implements OnInit {
  private mainTimerInterval: any;
  public seconds: number = 3;
  finTemporizador: boolean = false;

  InicialesJugador="CMI";
  NombreJugador="";
  Posicion=0;


  ngOnInit() {
    this.mainTimerInterval = setInterval(() => {
      if (this.seconds > 0) {
        this.seconds--;
      } else {
        this.finTemporizador=true;
        clearInterval(this.mainTimerInterval);
        // Aquí puedes agregar una acción personalizada cuando el temporizador haya finalizado.
      }
    }, 1000);
  }

  ngOnDestroy() {
    if (this.mainTimerInterval) {
      clearInterval(this.mainTimerInterval);
    }
  }

}
