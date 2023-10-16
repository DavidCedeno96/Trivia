import {
  Component,
  HostListener,
  Renderer2,
  ElementRef,
  OnInit,
  AfterViewInit,
  Output,
  EventEmitter,
  Input, ViewChild,
  ViewChildren, QueryList
} from '@angular/core';
import { Opcion, Pregunta, Pregunta_OpcionList } from 'src/app/model/SalaModel';



declare var bootstrap: any;
declare var LeaderLine: any;



@Component({
  selector: 'app-challengers-game',
  templateUrl: './challengers-game.component.html',
  styleUrls: ['./challengers-game.component.css'],
})
export class ChallengersGameComponent implements OnInit, AfterViewInit {

  valoresXsenSave: number[] = [];

  @ViewChild('elementoVehiculo', { static: true }) elementoVehiculo?: ElementRef;
  indiceActual = 0;


  @ViewChildren('elementoImagen') elementosImagen?: QueryList<ElementRef>;


  @Output() numVentanaH = new EventEmitter<number>();
  @Input() PreguntasList: Pregunta_OpcionList[] = [];

  EdificiosCount: number[] = [];

  //mostrarModal: boolean = false;

  //Ruta de imagenes de los botones
  svgActivo: string = 'assets/Icons/btnGameActivo.svg';
  svgInactivo: string = 'assets/Icons/btnGameInactivo.svg';
  svgVisitado: string = 'assets/Icons/btnGameVisitado.svg';

  //Ruta de las imagenes que van entre los botones
  imagenes: string[] = [
    'assets/Imagenes Juego/Barco.png',
    'assets/Imagenes Juego/Industria.png',
    'assets/Imagenes Juego/Granja.png',
    'assets/Imagenes Juego/Planta.png',
    'assets/Imagenes Juego/Campero.png',
    'assets/Imagenes Juego/Cajero.png',
  ];

  imagenFinal: string = 'assets/Imagenes Juego/CasaFinal.png';

  numImagenesColocadas: number = 0;

  //Menjsae error
  Mensaje_error: string="Respuesta equivocada";

  //Para creara los botones y las imagenes

  botones: {
    id: any;
    svg: string;
    tipo: string;
    rutaImagen: string;
    
  }[] = [];

  //Para las posiciones senosoidales

  centroX: number = 20;
  centroY: number = 20;
  cantidadDeBotones = 20;
  amplitud = 50;
  frecuencia = 10; // Ajusta la frecuencia según la cantidad de botones

  //Para el modal

  mostrarAlert = false;
  mostrarWrongAlert = false;
  modalElement: any;
  modal: any;

  //Para colocar las preguntas
  preguntaActual: Pregunta = {
    idPregunta: 0,
    nombre: 'Mi primera Pregunta de prueba',
    idSala: 0,
    estado: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
  };

  opcioTest1: Opcion = {
    idOpcion: 1,
    nombre: 'Primera opción para responder a la pregunta',
    correcta: 0,
    estado: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    idPregunta: 0,
  };

  opcioTest2: Opcion = {
    idOpcion: 2,
    nombre: 'Segunda opción para responder a la pregunta',
    correcta: 1, //0 para falso; 1 verdadero
    estado: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    idPregunta: 0,
  };

  preguntaOpcionActual: Pregunta_OpcionList = {
    pregunta: this.preguntaActual,
    opcionList: [this.opcioTest1, this.opcioTest2, this.opcioTest1],
  };
  preguntaOpcionTest: Pregunta_OpcionList = {
    pregunta: this.preguntaActual,
    opcionList: [this.opcioTest1, this.opcioTest2],
  };

  listaDePreguntas: Pregunta_OpcionList[] = [];

  // numPreguntaActual: number = 0;
  preguntaTexto: string = '';
  actualOpcionList: any[] = [];
  botonSeleccionado: boolean[] = [];

  numPreguntasContestadas: number = 0;
  puntosGanados: number = 0;
  puedeResponder: boolean = true;

  //MUSICA
  musicaFondo: HTMLAudioElement | null = null;

  //TEMPORIZADOR Y SUMA DEL TIEMPO QUE SE DEMORQA EN RESPONDER

  numIntervaloImg: number = 4;
  countdown: number = 20; // Temporizador principal en segundos

  mainTimerInterval: any;
  userClicked: boolean = false;
  startTime: Date = new Date('2023-10-10T10:00:00');
  userClickTime: Date = new Date('2023-10-10T10:00:00');

  tiempoDelJugador: number = 0;
  isTimerRunning: boolean = false;

  juegoTerminado: boolean = false;

  constructor(private renderer: Renderer2, private el: ElementRef) {
    this.numPreguntasContestadas = 0;
    this.puntosGanados = 0;
    this.puedeResponder = true;
    this.tiempoDelJugador = 0; //Tiempo que se demora en contestar las preguntas, esto se acumula
    //const line = new LeaderLine();
  
  }

  ngOnInit() {
    
    //MUSICA NO LE PONEMOS EN METODO APARTE PORQUE DEJA DE FUNCIONAR
    this.musicaFondo = new Audio();
    this.musicaFondo.src = 'assets/musicAndSFX/MusicGame.mp3'; // Ruta a tu archivo de música
    this.musicaFondo.loop = true;
    this.musicaFondo.volume = 0.25; // Volumen (0.5 representa la mitad del volumen)
    this.musicaFondo.play();    

    setTimeout(() => {
      //this.mostrarModal();//ACTIVAR CUANDO TERMINES DE TESTEAR
      //console.log("Entro");
    }, 3000);

    this.listaDePreguntas = this.PreguntasList;

    //Para las imagenes de los edificios principales

    const OpNumEdif = this.listaDePreguntas.length*3/5.75;
    var numberOfItems = 0;    

    if (OpNumEdif % 1 >= 0.5) {
      numberOfItems = Math.ceil(OpNumEdif);
    } else {
       numberOfItems = Math.trunc(OpNumEdif);
      }
      this.EdificiosCount = Array.from({ length: numberOfItems }, (_, index) => index);  
      console.log(this.EdificiosCount);

    if (this.listaDePreguntas.length > 20) {
      this.numIntervaloImg = 5;
    }
    this.numImagenesColocadas = 0; //Actualizo la cantidad de imagenes colocadas
    this.cantidadDeBotones = this.listaDePreguntas.length; //La cantidad de botones es igual a la cantidad de preguntas
    this.rellenarPregunta(1);
    this.updateCenters(window.innerWidth);
    this.generateButtons();
    //console.log(this.PreguntasList);
    
  }

  ngAfterViewInit() {
    // Obtén el elemento .sinusoidal-container por su ID
    const sinusoidalContainer = document.getElementById('sinusoidal-container');
    // Establece la altura deseada en píxeles
    const alturaDeseada = this.listaDePreguntas.length*130+this.numImagenesColocadas*160+290; // Cambia esto al valor que necesites

    // Verifica si el elemento se encontró antes de intentar establecer la altura
    if (sinusoidalContainer) {
      //console.log("Num preguntas"+this.listaDePreguntas.length);
      sinusoidalContainer.style.height = alturaDeseada + 'px';
      //console.log("Num preguntas"+this.listaDePreguntas.length);
    }

    setTimeout(() => {
      this.adjustLines();
    }, 500);

    window.addEventListener('resize', () => {
      this.adjustLines();
    });

    

    for (let i = 0; i < this.listaDePreguntas.length-1; i++) {
      this.valoresXsenSave.push(this.calculateMargin(i));      
    }

    console.log(this.valoresXsenSave);  


    
  }

  adjustLines() {
    if (this.elementosImagen) {
      const elementos = this.elementosImagen.toArray();

      for (let i = 0; i < elementos.length - 1; i++) {
        console.log("LINEAS");
        const linea = new LeaderLine(elementos[i].nativeElement, elementos[i + 1].nativeElement, {dash: {animation: true}});
        
        linea.show('draw');
        linea.setOptions({
          
          color: '#b9b9b9',
          size: 15,
          endPlug: 'behind', // Terminación en cuadrado (sin flecha)
          path: 'straight', // Línea recta, sin curvas
          dash: {
            animation: {
              duration: 2500, // Duración en milisegundos
              timing: 'linear', // Función de temporización, por ejemplo, 'linear', 'ease-in', 'ease-out', etc.
            },
          },
          
        });
      }
    }

  }

  rellenarPregunta(numPregunta: number) {
    console.log(numPregunta);
    setTimeout(() => {
      this.quitarSeleccionado();
      const PreguntaActual = this.listaDePreguntas[numPregunta - 1];
      this.preguntaTexto = PreguntaActual.pregunta.nombre;
      this.actualOpcionList = PreguntaActual.opcionList;
      //Activamos el primer boton del camino
      if (numPregunta == 1) {
        this.activarBoton(1, 1);
      }
    }, 1000);
  }

  quitarSeleccionado() {
    const reiniciarSeleccionados: boolean[] = [];
    for (let i = 0; i < this.actualOpcionList.length; i++) {
      reiniciarSeleccionados.push(false);
    }
    this.botonSeleccionado = reiniciarSeleccionados;
  }

  mostrarModal() {
    this.modalElement = this.el.nativeElement.querySelector('#exampleModal');
    this.modal = new bootstrap.Modal(this.modalElement);
    this.resetTimer();
    this.modal.show();
    //this.musicaFondo.play();
    //TIEMPO
    this.startTime = new Date(); //CAPTURAMOS LA HORA QUE EMPIEZA EN MILISENGOS
  }

  closeModal(id: number) {
    if (this.puedeResponder) {
      this.userClicked = true;
      this.stopTimer(); // Detiene el temporizador principal
      this.userClickTime = new Date();
      this.puedeResponder = false;

      this.botonSeleccionado[id] = true;
      const respuestaSeleccionada = this.actualOpcionList[id];
      this.tiempoDelJugador +=
        this.userClickTime.getTime() - this.startTime.getTime();
      console.log(this.tiempoDelJugador);
      if (respuestaSeleccionada.correcta === 1) {
        // La respuesta es correcta, puedes reproducir un sonido, cambiar el color, etc.
        this.puntosGanados++;
        this.mostrarAlert = true;
        this.reproducirSonido('assets/musicAndSFX/QuizCorrect.wav');

        setTimeout(() => {
          this.mostrarAlert = false;
          this.modal.hide();
          this.numPreguntasContestadas++;
          this.puedeResponder = true;
          this.countdown = 20;
        }, 3000); // 3000 milisegundos = 3 segundos
      } else {
        this.Mensaje_error = "Respuesta equivocada"
        this.preguntaMalConstestada();
      }

      this.pasarAOtraPregunta();
    }
  }

  preguntaMalConstestada() {
    this.mostrarWrongAlert = true;
    this.reproducirSonido('assets/musicAndSFX/QuizWrong.wav');
    setTimeout(() => {
      this.mostrarWrongAlert = false;
      this.modal.hide();
      this.numPreguntasContestadas++;
      this.puedeResponder = true;
      this.countdown = 20;
    }, 3000); // 3000 milisegundos = 3 segundos
  }

  pasarAOtraPregunta() {
    console.log(this.numPreguntasContestadas);
    console.log(this.listaDePreguntas.length);

    if (this.numPreguntasContestadas + 1 < this.listaDePreguntas.length) {
      setTimeout(() => {
        this.activarBoton(this.numPreguntasContestadas + 1, 1);
        this.rellenarPregunta(this.numPreguntasContestadas + 1);
      }, 3500);

      setTimeout(() => {
        this.mostrarModal();
      }, 4000);
    } else {
      setTimeout(() => {
        this.onClickCambiar();
      }, 2000);
    }
  }

  reproducirSonido(nombreArchivo: string) {
    const audio = new Audio();
    audio.src = nombreArchivo;
    audio.load();
    audio.play();
  }



  updateCenters(windowWidth: number) {
    if (windowWidth >= 1200) {
      // xl
      this.centroX = 650;
      //this.centroY = 200;
    } else if (windowWidth >= 992) {
      // lg
      this.centroX = 580;
      //this.centroY = 150;
    } else if (windowWidth >= 768) {
      // md
      this.centroX = 320;
      //this.centroY = 100;
    } else {
      // sm
      this.centroX = 120;
      this.amplitud = 40;
      //this.centroY = 50;
    }
  }

  generateButtons() {
    //this.frecuencia = (2 * Math.PI) / this.cantidadDeBotones;

    for (let i = 1; i <= this.cantidadDeBotones; i++) {
      /* const x = this.centroX + this.amplitud * Math.sin(this.frecuencia * i);
      const y = this.centroY + i * 20;
      var x2 = 0;
      var y2 = 0; */

      // Agrega una imagen FINAL DESPUES DEL ULTIMO BOTON
      if (i == this.cantidadDeBotones) {
      /*   x2 = this.centroX + this.amplitud * Math.sin(this.frecuencia * (i + 1));
        y2 = this.centroY + (i + 1) * 20; */
        /* this.botones.push({
          id: 'imagen-FINAL',         
          svg: '',
          tipo: 'imagen',
          rutaImagen: this.imagenFinal,
        }); */
      }else{
        this.botones.push({
          id: i - this.numImagenesColocadas,
          svg: this.svgInactivo,
          tipo: 'boton',
          rutaImagen: '',
        });
      }
    }
  }

/*   updateButtonPositions() {
    const buttons =
      this.el.nativeElement.querySelectorAll('.sinusoidal-button');
    this.botones.forEach((button, index) => {
      this.renderer.setStyle(buttons[index], 'left', button.x + 'px');
      this.renderer.setStyle(buttons[index], 'top', button.y + 'px');
    });
  } */

  activarBoton(id: number, imgCambio: number) {
    const boton = this.botones.find((b) => b.id === id);
    if (boton) {
      switch (imgCambio) {
        case 1:
          boton.svg = this.svgActivo;
          break;
        /*  case 2:
          boton.svg=this.svgInactivo;
          break;
        case 3:
          boton.svg=this.svgVisitado;
          break; */
        default:
          boton.svg = this.svgActivo;
          break;
      }
      // Hacer scroll hacia el botón activado
      const buttonElement = this.el.nativeElement.querySelector(`#boton-${id}`);
      if (buttonElement) {
        buttonElement.scrollIntoView({ behavior: 'smooth' }); // Hace scroll suavemente
      }
    }
  }

  //para el temporizador
  startMainTimer() {
    if (!this.isTimerRunning) {
      this.isTimerRunning = true; // Marca que el temporizador está en funcionamiento
      this.countdown = 20; // Restablece el tiempo en segundos
      this.mainTimerInterval = setInterval(() => {
        if (!this.userClicked) {
          this.countdown--; // Temporizador principal disminuye en segundos
        }
        if (this.countdown <= 0) {
          this.puedeResponder = false;
          this.userClicked = true;
          this.preguntaMalConstestada();
          this.stopTimer();
          this.pasarAOtraPregunta();
          this.Mensaje_error = "Se acabo el tiempo"
        }
      }, 1000); // El temporizador principal se actualiza cada segundo (1000 ms)
    }
  }

  stopTimer() {
    clearInterval(this.mainTimerInterval); // Detiene el temporizador principal
    //this.countdown=20;
    this.isTimerRunning = false; // Marca que el temporizador ya no está en funcionamiento
  }

  resetTimer() {
    this.countdown = 20; // Reiniciar el tiempo en segundos
    this.userClicked = false; // Reiniciar el estado del usuario
    this.startMainTimer(); // Iniciar nuevamente el temporizador principal
  }

  onClickCambiar() {
    this.juegoTerminado = true;

    //RESULTADO RECOPILADOS
    console.log('Tiempo transcurrido=' + this.tiempoDelJugador);
    console.log('Puntos Jugador=' + this.puntosGanados);
    console.log('Juego terminado=' + this.juegoTerminado);

    //Cuando finalicé el juego directo a esta ventana
    this.musicaFondo?.pause();
    // @ts-ignore
    this.musicaFondo.currentTime = 0;
    this.numVentanaH.emit(3); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
  }

  calculateMargin(index: number): number {
    const amplitude = 100; // Ajusta la amplitud del coseno según sea necesario
    const frequency = 1; // Ajusta la frecuencia del coseno según sea necesario
    const res = Math.round(amplitude * Math.cos(frequency * index))
    //console.log(index+" margin "+res);
    
    return res;
  }

  calculateMargin2(index: number): number {
    if(index % 2 == 0){
      return 0;     
      
    }else{
      
      if(index % 3 == 0){
        return -220;
      }
      else{
        return 150;
      }
    }
  }

  //FUNCION PARA MOVER EL AUTO
  avanzarVehiculo() {
    if (this.indiceActual < this.botones.length - 1) {
      this.indiceActual++;
      this.colocarVehiculoEnBoton(this.indiceActual);
    }
  }

  colocarVehiculoEnBoton(indice:number) {
    if (indice < this.botones.length) {
      const boton = this.botones[indice];
      const elementoBoton = document.getElementById('boton-' + boton.id);

      if (elementoBoton && this.elementoVehiculo) {
        const coordenadasBoton = elementoBoton.getBoundingClientRect();
        const coordenadasVehiculo = this.elementoVehiculo.nativeElement.getBoundingClientRect();

        const distanciaX = coordenadasBoton.left - coordenadasVehiculo.left + coordenadasBoton.width / 2 - coordenadasVehiculo.width / 2;
        const distanciaY = coordenadasBoton.top - coordenadasVehiculo.top + coordenadasBoton.height / 2 - coordenadasVehiculo.height / 2;

        this.elementoVehiculo.nativeElement.style.transition = 'transform 0.5s linear';
        this.elementoVehiculo.nativeElement.style.transform = `translate(${distanciaX}px, ${distanciaY}px)`;
      }
    }
  }

}
