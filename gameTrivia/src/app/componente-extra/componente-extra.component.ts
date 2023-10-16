import { Component } from '@angular/core';

@Component({
  selector: 'app-componente-extra',
  templateUrl: './componente-extra.component.html',
  styleUrls: ['./componente-extra.component.css']
})
export class ComponenteExtraComponent {

  number: number = 2;
  
  increment() {
    if (this.number < 4) {
      this.number++;
    }
  }

  decrement() {
    if (this.number > 2) {
      this.number--;
    }
  }

  ngOnInit() {
    this.startTime = new Date();
    this.startMainTimer();
  }

  question: string = '¿Cuál es la capital de Francia?';
  options: string[] = ['París', 'Londres', 'Berlín'];
  correctAnswer: string = 'París';
  countdown: number = 20; // Temporizador principal en segundos
  
  mainTimerInterval: any;
  userClicked: boolean = false;
  startTime: Date = new Date('2023-10-10T10:00:00');;
  userClickTime: Date = new Date('2023-10-10T10:00:00');;


  startMainTimer() {
    this.mainTimerInterval = setInterval(() => {
      if (!this.userClicked) {
        this.countdown--; // Temporizador principal disminuye en segundos
      }
    }, 1000); // El temporizador principal se actualiza cada segundo (1000 ms)
  }

  stopTimer() {
    clearInterval(this.mainTimerInterval); // Detiene el temporizador principal
  }

  checkAnswer(answer: string) {
    this.userClickTime = new Date();
    this.userClicked = true; // Indica que el usuario ha hecho clic en una opción
    this.stopTimer(); // Detiene el temporizador principal

    if (answer === this.correctAnswer) {
      console.log('¡Respuesta correcta!');
    } else {
      console.log('Respuesta incorrecta. La respuesta correcta es: ' + this.correctAnswer);
    }

    // Calcula el tiempo de respuesta en milisegundos
    const responseTimeInMillis = this.userClickTime.getTime() - this.startTime.getTime();
    console.log('Tiempo de respuesta: ' + responseTimeInMillis + ' milisegundos');

    
  }
}





