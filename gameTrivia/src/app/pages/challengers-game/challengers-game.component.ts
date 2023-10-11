import { Component, HostListener,  Renderer2, ElementRef, OnInit, AfterViewInit   } from '@angular/core';
import { Opcion, Pregunta, Pregunta_OpcionList } from 'src/app/model/SalaModel';

declare var bootstrap: any;


@Component({
  selector: 'app-challengers-game',
  templateUrl: './challengers-game.component.html',
  styleUrls: ['./challengers-game.component.css']
})
export class ChallengersGameComponent implements OnInit, AfterViewInit     {

  //mostrarModal: boolean = false;
  
  //Ruta de imagenes de los botones
  svgActivo:string="assets/Icons/btnGameActivo.svg";
  svgInactivo:string="assets/Icons/btnGameInactivo.svg";
  svgVisitado:string="assets/Icons/btnGameVisitado.svg";

  //Ruta de las imagenes que van entre los botones
  imagenes:string[]=[
    "assets/Imagenes Juego/Barco.png",
    "assets/Imagenes Juego/Industria.png",
    "assets/Imagenes Juego/Granja.png",
    "assets/Imagenes Juego/Planta.png",
    "assets/Imagenes Juego/Campero.png"];  

  numImagenesColocadas: number = 0;

  //Para creara los botones y las imagenes

  botones: { id: any, svg: string, tipo: string, rutaImagen: string, x: number, y: number }[] = [];

  //Para las posiciones senosoidales
  
  centroX: number = 20;
  centroY: number = 20;
  cantidadDeBotones = 20;
  amplitud = 100;
  frecuencia = 0; // Ajusta la frecuencia según la cantidad de botones

  //Para el modal

  mostrarAlert = false;
  mostrarWrongAlert = false;
  modalElement:any;
  modal:any;

  //Para colocar las preguntas
  preguntaActual: Pregunta = {
    idPregunta: 0,
    nombre: "Mi primera Pregunta de prueba",
    idSala: 0,
    estado: 0,
    fecha_creacion: "",
    fecha_modificacion: "",
  };

  opcioTest1:Opcion = {
    idOpcion: 1,
  nombre: "Primera opción para responder a la pregunta",
  correcta: 0, //0 para falso; 1 verdadero
  estado: 0,
  fecha_creacion: "",
  fecha_modificacion: "",
  };

  opcioTest2:Opcion = {
    idOpcion: 2,
    nombre: "Segunda opción para responder a la pregunta",
    correcta: 1, //0 para falso; 1 verdadero
    estado: 0,
    fecha_creacion: "",
    fecha_modificacion: "",
  };

  
  preguntaOpcionActual: Pregunta_OpcionList = {
    pregunta: this.preguntaActual,
  opcionList:[this.opcioTest1, this.opcioTest2, this.opcioTest1],
  };

  listaDePreguntas: Pregunta_OpcionList[] = [];

 // numPreguntaActual: number = 0;
  preguntaTexto: string = "";
  actualOpcionList: any[]=[];
  botonSeleccionado: boolean[]=[];

  numPreguntasContestadas: number = 0;
  puntosGanados: number = 0;
  puedeResponder: boolean = true;  

  //MUSICA
  musicaFondo: HTMLAudioElement | null = null;

  //TEMPORIZADOR Y SUMA DEL TIEMPO QUE SE DEMORQA EN RESPONDER

  countdown: number = 20; // Temporizador principal en segundos
  
  mainTimerInterval: any;
  userClicked: boolean = false;
  startTime: Date = new Date('2023-10-10T10:00:00');
  userClickTime: Date = new Date('2023-10-10T10:00:00');

  tiempoDelJugador: number = 0;
  isTimerRunning: boolean = false;


  constructor(private renderer: Renderer2, private el: ElementRef) {
    
    this.numPreguntasContestadas = 0;
    this.puntosGanados = 0;
    this. puedeResponder = true;
    this.tiempoDelJugador = 0;
    //Test para las preguntas
    for (let index = 0; index < this.cantidadDeBotones; index++) {
      this.listaDePreguntas.push(this.preguntaOpcionActual);            
    }
    this.numImagenesColocadas = 0; 
    this.rellenarPregunta(1);  
    this.updateCenters(window.innerWidth);
    this.generateButtons();
    console.log(this.listaDePreguntas);     
  }

  ngOnInit(){
     //MUSICA NO LE PONEMOS EN METODO APARTE PORQUE DEJA DE FUNCIONAR    
     this.musicaFondo = new Audio();
     this.musicaFondo.src = 'assets/musicAndSFX/MusicGame.mp3'; // Ruta a tu archivo de música
     this.musicaFondo.loop = true;
     this.musicaFondo.volume = 0.25; // Volumen (0.5 representa la mitad del volumen)
     this.musicaFondo.play();    

    setTimeout(() => {
      this.mostrarModal();
      //console.log("Entro");
    },3000);       
  }

  ngAfterViewInit(){
    
  }

  rellenarPregunta(numPregunta:number){
    console.log(numPregunta);
    setTimeout(() => {
      this.quitarSeleccionado();
      const PreguntaActual = this.listaDePreguntas[numPregunta-1]
      this.preguntaTexto=PreguntaActual.pregunta.nombre;
      this.actualOpcionList = PreguntaActual.opcionList;
      //Activamos el primer boton del camino
      if(numPregunta==1){
        this.activarBoton(1,1);      }
      
    },1000);   
  }

  quitarSeleccionado(){
    const reiniciarSeleccionados: boolean[]=[];
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
    this.startTime = new Date();//CAPTURAMOS LA HORA QUE EMPIEZA EN MILISENGOS
  }

  closeModal(id:number) {
    if (this.puedeResponder) {
      this.userClicked=true;
      this.stopTimer(); // Detiene el temporizador principal
      this.puedeResponder = false;      
      
      this.botonSeleccionado[id]=true;
      const respuestaSeleccionada = this.actualOpcionList[id];
      this.tiempoDelJugador += (this.userClickTime.getTime() - this.startTime.getTime());
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
          this.puedeResponder=true;
          this.countdown=20;
        }, 3000); // 3000 milisegundos = 3 segundos
      }else{
        this.preguntaMalConstestada();
      }

      this.pasarAOtraPregunta();      
    }
            
  }

  preguntaMalConstestada(){
    this.mostrarWrongAlert = true;
        this.reproducirSonido('assets/musicAndSFX/QuizWrong.wav');
        setTimeout(() => {
          this.mostrarWrongAlert = false;     
          this.modal.hide();
          this.numPreguntasContestadas++;
          this.puedeResponder=true;
          this.countdown=20;
        }, 3000); // 3000 milisegundos = 3 segundos
  }

  pasarAOtraPregunta(){

    setTimeout(() => {
      this.activarBoton(this.numPreguntasContestadas+1,1);
      this.rellenarPregunta(this.numPreguntasContestadas+1); 
    }, 3500);

    setTimeout(() => {
      this.mostrarModal(); 
    }, 4000);

  }

  reproducirSonido(nombreArchivo: string) {
    const audio = new Audio();
    audio.src = nombreArchivo;
    audio.load();
    audio.play();
  }
  

  @HostListener('window:resize', ['$event'])
  onResize(event: Event) {
    this.updateCenters((event.target as Window).innerWidth);
    this.updateButtonPositions();
  }

  updateCenters(windowWidth: number) {
    if (windowWidth >= 1200) { // xl
      this.centroX = 700;
      //this.centroY = 200;
    } else if (windowWidth >= 992) { // lg
      this.centroX = 580;
      //this.centroY = 150;
    } else if (windowWidth >= 768) { // md
      this.centroX = 300;
      //this.centroY = 100;
    } else { // sm
      this.centroX = 100;
      this.amplitud = 110
      //this.centroY = 50;
    }

  }

  generateButtons() {
    
    this.frecuencia =  4 * Math.PI / this.cantidadDeBotones;

    for (let i = 1; i <= this.cantidadDeBotones; i++) {
      const x = this.centroX + this.amplitud * Math.sin(this.frecuencia * i);
      const y = this.centroY + i * 20;      

      // Agrega una imagen adicional cada 3 botones
    if (i % 4 === 0 && i !== this.cantidadDeBotones) {  
      this.numImagenesColocadas++;
      this.cantidadDeBotones++;
      const rutaSelect = this.imagenes[this.numImagenesColocadas-1];    
      this.botones.push({ id: 'imagen-' + i, x, y, svg:"", tipo: 'imagen', rutaImagen: rutaSelect });
    }else{
      this.botones.push({ id: i-this.numImagenesColocadas,  x, y, svg: this.svgInactivo, tipo: "boton", rutaImagen: "" });

    }
    }
  }

  updateButtonPositions() {
    const buttons = this.el.nativeElement.querySelectorAll('.sinusoidal-button');
    this.botones.forEach((button, index) => {
      this.renderer.setStyle(buttons[index], 'left', button.x + 'px');
      this.renderer.setStyle(buttons[index], 'top', button.y + 'px');
    });
  }

  activarBoton(id: number, imgCambio: number) {
    const boton = this.botones.find(b => b.id === id);
    if (boton) {
      switch (imgCambio) {
        case 1:
         boton.svg=this.svgActivo;
          break;
       /*  case 2:
          boton.svg=this.svgInactivo;
          break;
        case 3:
          boton.svg=this.svgVisitado;
          break; */
        default:
          boton.svg=this.svgActivo;
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

}