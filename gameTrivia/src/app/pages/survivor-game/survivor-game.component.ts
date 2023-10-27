import {
  AfterViewInit,
  Component,
  ElementRef,
  Input,
  OnDestroy,
  OnInit,
  Renderer2,
} from '@angular/core';
import { Router } from '@angular/router';
import { EncryptionService } from 'src/app/encryption.service';
import {  PuntosJugador } from 'src/app/model/PuntosJugador';
import { Opcion, Pregunta, Pregunta_OpcionList } from 'src/app/model/SalaModel';
import { UsuarioSalaService } from 'src/app/services/usuario-sala.service';
import { UsuarioService } from 'src/app/services/usuario.service';
import { MessageService } from 'primeng/api';
import { ConstantsService } from 'src/app/constants.service';


import { trigger, state, style, transition, animate } from '@angular/animations';

declare var bootstrap: any;

@Component({
  selector: 'app-survivor-game',
  templateUrl: './survivor-game.component.html',
  styleUrls: ['./survivor-game.component.css'],
  providers: [MessageService],
  animations: [
    trigger('jugadoresChanged', [
      state('changed', style({ transform: 'scale(1.2)' })),
      transition('* => changed', [animate('0.2s')]),
    ]),
  ],
})
export class SurvivorGameComponent implements OnInit, AfterViewInit, OnDestroy {

  tiempoPregunta=14;

  msjContadorStart=false;


  //Menjase error
  Mensaje_error: string = 'Respuesta equivocada';

  //Para el modal

  mostrarAlert = false;
  mostrarWrongAlert = false;
  modalElement: any;
  modal: any;
  mostrarMsjAnalisis: boolean = false;

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

  // PARA LAS PREGUNTAS
  preguntaTexto: string = '';
  actualOpcionList: any[] = [];
  botonSeleccionado: boolean[] = [];

  numPreguntasContestadas: number = 0;
  puntosGanados: number = 0;
  puedeResponder: boolean = true;

  //PARA LA SALA
  numerodeJugadores: number = 0;
  AuxNumerodeJugadores: number = 0;

  //sala y usuario

  idSala: number = 0;
  idUsuario: number = 0;

  puntosJugador: PuntosJugador = {
    idUsuario: 0,
    iniciales: 'PP',
    usuario: 'Prueba prueba',
    rol: '',
    idSala: 0,
    sala: '',
    puntaje: 23,
    tiempo: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
  };
  //TEMPORIZADOR Y SUMA DEL TIEMPO QUE SE DEMORQA EN RESPONDER

  numIntervaloImg: number = 4;
  countdown: number = this.tiempoPregunta; // Temporizador principal en segundos

  mainTimerInterval: any;
  userClicked: boolean = false;
  startTime: Date = new Date('2023-10-10T10:00:00');
  userClickTime: Date = new Date('2023-10-10T10:00:00');

  tiempoDelJugador: number = 0;
  isTimerRunning: boolean = false;

  juegoTerminado: boolean = false;

  //Tiempo
  tiempoMostrarPrimerModal: number = 5000;
  tiempoMostrarModal: number = 10000;
  tiempoMostrarRespuesta: number = 4500;
  tiempoMostrarOtraPregunta: number =5500;

  //MUSICA
  musicaFondo: HTMLAudioElement | null = null;

  @Input() PreguntasList: Pregunta_OpcionList[] = [];

  //Circulos de nuevos jugadores
  circles: { left: number; top: number }[] = [];
  texts: string[] = ['AB', 'DC', 'CMI', 'AC'];

  //Jugadores Eliminados
  idJugador=0;
  jugadoresSala: PuntosJugador[]=[]; 
  mostrarEspera: boolean= false;
  isLife: boolean = true;
  isUltimoenPie: boolean = false;
  numerodeEliminados = 0;

  //Para una pequeña animacion
  animationState = '';

  //Para repetir pregunta
  repetirPregunta = false;

  //identificar si usuario gano
  ganoJugador = false;

  //Para cambiar la imagen de al fondo
  mostrarJugadorVivo=true;
  imgJugadorVivo = "assets/Imagenes Juego/JugadorVivo.png";
  imgJugadorMuerto = "assets/Imagenes Juego/jugadorMuerto.png";
  imgXEliminado = "assets/Imagenes Juego/JugadorXEliminado.png";
  mostrarEliminados=false;
  msjResultados = "";
  msjR1="Obteniendo Resultados de otros jugadores";
  msjR2="Revisando Resultados";


  //Musica compuesta
  playlist: string[] = [
    'assets/musicAndSFX/EpicPower_Inicio.mp3',
    'assets/musicAndSFX/Epic_Power_Loop.mp3',    
  ];
  currentTrackIndex: number = 0;

    constructor(
    private renderer: Renderer2,
    private el: ElementRef,
    private encryptionService: EncryptionService,
    private router: Router,
    private usuarioSalaService: UsuarioSalaService,
    private usuarioService: UsuarioService,
    private constantsService: ConstantsService,
    private messageService: MessageService
  ) {
    this.numPreguntasContestadas = 0;
    this.puntosGanados = 0;
    this.puedeResponder = true;
    this.tiempoDelJugador = 0; //Tiempo que se demora en contestar las preguntas, esto se acumula
  }
  ngOnInit() {
    //MUSICA NO LE PONEMOS EN METODO APARTE PORQUE DEJA DE FUNCIONAR
    //this.musicaFondo = new Audio();
    //this.musicaFondo.src = 'assets/musicAndSFX/MusicaGame4.mp3'; // Ruta a tu archivo de música
    //this.musicaFondo.loop = true;
    //this.musicaFondo.volume = 0.25; // Volumen (0.5 representa la mitad del volumen)
    //this.musicaFondo.play();

    //MUSICA COMPUESTA
    this.playCurrentTrack();

    if (!this.usuarioService.getIdUsuario()) {
      this.router.navigate(['/']);
    } else {
      this.idUsuario = parseInt(this.usuarioService.getIdUsuario()!);
    }

    //Obtengo nuevos jugadores
    this.getNumJugadoresNuevos();
    //Test para ve el numero cambiado
    setTimeout(() => {
      this.updateNumJugadores(6);
    },2500);


    setTimeout(() => {
      this.mostrarModal(); //ACTIVAR CUANDO TERMINES DE TESTEAR <------------
      //console.log("Entro");      
    }, this.tiempoMostrarPrimerModal);

    //this.idSala = this.PreguntasList[0].pregunta.idSala;//<-Activar cuando tenga preguntas

    for (let i = 0; i < 6; i++) {
      this.listaDePreguntas.push(this.preguntaOpcionActual);
    }
    console.log(this.listaDePreguntas);
    //this.listaDePreguntas = this.PreguntasList;//ACTIVAR CUANDO TERMINES DE TESTEAR <------------

    //Para las imagenes de los edificios principales

    this.rellenarPregunta(1);
    //this.updateCenters(window.innerWidth);
    
    this.generarCirculos(4);
  }
  ngAfterViewInit() {}

  ngOnDestroy(): void {
    //this.modal.hide();
  }

  //Para musica compuesta
  playCurrentTrack() {
    this.musicaFondo = new Audio;
    this.musicaFondo.src= this.playlist[this.currentTrackIndex];
    this.musicaFondo.load();
    this.musicaFondo.play();
    this.musicaFondo.volume = 0.25; 
    this.musicaFondo.onended = () => {
      if (this.currentTrackIndex === 0) {
        this.currentTrackIndex = 1; // Pasa a la segunda pista
        this.playCurrentTrack();
      } else {
        // Reproduce la segunda pista en bucle
        if(this.musicaFondo){
          this.musicaFondo.play();
        }
        
      }
    };
  }

  updateNumJugadores(nuevoNumero: number) {
    console.log("Jugadores "+nuevoNumero);
    this.animationState = 'changed';
    this.numerodeJugadores = nuevoNumero;

    setTimeout(() => {
      this.animationState = '';
    }, 200); // Restablece la animación después de 200 ms
  }


  getNumJugadoresNuevos(){
     //Obtener nuevo jugadores de la bd
     const listaJugadoresBD = this.getListaBD();
     this.updateNumJugadores(listaJugadoresBD.length);

     //Comparar la lista de bd con la lista guardada
     const listaNuevos = this.jugadoresSala.filter((elemento1) => {
      return !listaJugadoresBD.some((elemento2) => elemento2.idUsuario == elemento1.idUsuario);
    });

    if(listaNuevos.length>0){
      //Si hay nuevo jugadores los guardo en mi lista jugadores Sala
      this.jugadoresSala=listaJugadoresBD;
      const textsAux: string[] = [];

      for (let i = 0; i < listaNuevos.length; i++) {
        textsAux.push(listaNuevos[i].iniciales);        
      }
      //actualizo la lista de texto de los circulos animados
      this.texts=textsAux;
      this.generarCirculos(listaNuevos.length)
    }

  }

  getNumJugadoresMuertos(){
    console.log("Jugadores muertos");
    //Obtener nuevo jugadores de la bd
    const listaJugadoresBD = this.getListaBD();
    const PosicionActual = this.numPreguntasContestadas;
    
    //Comparar la lista de bd con la lista guardada
    

    const valorInicial: { jugadoresMuertos: PuntosJugador[]; jugadoresVivos: PuntosJugador[] } = { jugadoresMuertos: [], jugadoresVivos: [] };

    const { jugadoresMuertos, jugadoresVivos } = listaJugadoresBD.reduce(
      (result, jugador) => {
        if (jugador.puntaje < PosicionActual) {
          result.jugadoresMuertos.push(jugador);
        } else {
          result.jugadoresVivos.push(jugador);
        }
        return result;
      },
      valorInicial
    );

    this.updateNumJugadores(jugadoresVivos.length);

    //Si solo hay un jugador vivo <-- comprobar si este usuario ganó
    const idJugador = this.usuarioService.getIdUsuario();

    if(jugadoresVivos.length==1){
      if(jugadoresVivos[0].idUsuario.toString() == idJugador ){
        this.ganoJugador=true;
      }
    }

    if(jugadoresVivos.length==0){
      this.repetirPregunta=true;

    }
        

   if(jugadoresMuertos.length>0){
    
     //this.jugadoresSala=listaJugadoresBD;
     const textsAux: string[] = [];

     for (let i = 0; i < jugadoresMuertos.length; i++) {
       textsAux.push(jugadoresMuertos[i].iniciales);        
     }
     //actualizo la lista de texto de los circulos animados
     this.texts=textsAux;
     setTimeout(() => {
      this.generarCirculos(jugadoresMuertos.length)
    },2500);
     
   }

 }

  getListaBD(){
    console.log("Obtengo los nuevos jugadores");
    const listaJugadoresBD:PuntosJugador[] =[{
      idUsuario: 1,
      iniciales: 'AB',
      usuario: 'Ana Benitez',
      rol: '1',
      idSala: 1,
      sala: '1',
      puntaje: 2,
      tiempo: 0,
      fecha_creacion: '',
      fecha_modificacion: '',
     },{
      idUsuario: 2,
      iniciales: 'FB',
      usuario: 'Facebook',
      rol: '1',
      idSala: 1,
      sala: '1',
      puntaje: 4,
      tiempo: 0,
      fecha_creacion: '',
      fecha_modificacion: '',
     }]; //Lista de la bd TEST - ejemplo
     return listaJugadoresBD;
  }

  sendResultadoBD(){
    console.log("Envié mis resultados");
    this.puntosJugador.puntaje=this.puntosGanados;
    this.puntosJugador.tiempo=this.tiempoDelJugador;
  //COLOCAR FUNCION PARA ENVIAR A LA BD

  }


  generarCirculos(numCircles:number){
    this.mostrarJugadorVivo=true;
    const circlesAux: { left:number; top: number }[] = [];

    const minDistance = 50;
    const centerX = window.innerWidth / 2;
    const centerY = window.innerHeight / 2;
    
  
    for (let i = 0; i < numCircles; i++) {
      const circle = {
        left: this.getRandomNumber(50, window.innerWidth - 50), // Asegura que no se desborde en el ancho de la ventana
        top: this.getRandomNumber(50, window.innerHeight - 50), // Asegura que no se desborde en la altura de la ventana
      };
      circlesAux.push(circle);
    }
    this.circles = circlesAux;

    if(this.numPreguntasContestadas+1>1){
      setTimeout(() => {
        this.mostrarJugadorVivo=false;
        
      }, 1500);

    }
   
    
}

getRandomNumber(min:number, max:number) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

  mostrarModal() {
    //this.sidebarVisible4 = false;
    //this.value++;
    this.mostrarEliminados = false;
    this.modalElement = this.el.nativeElement.querySelector('#exampleModal');
    this.modal = new bootstrap.Modal(this.modalElement);
    this.resetTimer();
    const mainBody = document.getElementById('main-body');
    if (mainBody) {
      mainBody.style.overflowY = 'hidden';
    }

    this.modal.show();
    //this.musicaFondo.play();
    //TIEMPO
    this.startTime = new Date(); //CAPTURAMOS LA HORA QUE EMPIEZA EN MILISEGUNDOS
  }

  closeModal(id: number) {
    if (this.puedeResponder) {
      this.msjResultados = this.msjR1;
      //this.userClicked = true;
      this.mostrarEspera=true;
      //this.stopTimer(); // Detiene el temporizador principal
      this.userClickTime = new Date();
      this.puedeResponder = false;

      this.botonSeleccionado[id] = true;
      const respuestaSeleccionada = this.actualOpcionList[id];
      this.tiempoDelJugador =
        this.userClickTime.getTime() - this.startTime.getTime();
      console.log(this.tiempoDelJugador);
      this.mostrarMsjAnalisis=true;

      if (respuestaSeleccionada.correcta == 1) 
      {
        this.puntosGanados++;
        this.isLife=true;
        
      }else{
        this.Mensaje_error = 'Respuesta equivocada';
        this.isLife=false;
      }

     // this.numPreguntasContestadas++;

      this.sendResultadoBD();

    }
  }


  //Despues del temporizador pregunta bien y mal contestada me controlaran las siguientes

  preguntaMalConstestada() {

    this.msjResultados = this.msjR2;   

    //Mostramos resultados
    setTimeout(() => {
      this.mostrarEspera=false;
      this.mostrarWrongAlert = true;
      this.reproducirSonido('assets/musicAndSFX/QuizWrong.wav');      
    }, this.tiempoMostrarRespuesta);

   

    //Cerramos el modal    
    setTimeout(() => {
      this.mostrarWrongAlert = false;
      this.modal.hide();
      //this.numPreguntasContestadas++;
      this.puedeResponder = true;
      this.countdown = this.tiempoPregunta;
      this.onClickCambiar();
    }, this.tiempoMostrarRespuesta+5500); // 3000 milisegundos = 3 segundos
  }

  preguntaBienContestada(){
    this.msjResultados = this.msjR2;   

    //Mostramos resultados
    setTimeout(() => {
      this.mostrarEspera=false;
    this.mostrarAlert = true;
    this.reproducirSonido('assets/musicAndSFX/QuizCorrect.wav');
    }, this.tiempoMostrarRespuesta);

     
        setTimeout(() => {
          this.mostrarAlert = false;
          this.modal.hide();          
          this.puedeResponder = true;
          this.countdown = this.tiempoPregunta;
        }, this.tiempoMostrarRespuesta+5500); 
  }

  pasarAOtraPregunta() {   
        
    setTimeout(() => {
      
      this.mostrarEliminados=true;
    }, 3000);

    if (this.repetirPregunta) {      
      setTimeout(() => {
        this.generarCirculos(2);
      }, this.tiempoMostrarOtraPregunta);
    }    

    //Si toca repetir pregunta restamos 1 pregunta contestada
    if(this.repetirPregunta){
      this.numPreguntasContestadas--;      
    }

    //Pasamos a la siguiente pregunta
    //Si gano jugador, terminar juego
    if(this.ganoJugador){
      setTimeout(() => {
        this.onClickCambiar();
      }, 5000);
    }else{
      //Si aun no gana continuar con las preguntas
      if (this.numPreguntasContestadas + 1 < this.listaDePreguntas.length) {
        setTimeout(() => {
          //this.activarBoton(this.numPreguntasContestadas + 1, 1);
          this.rellenarPregunta(this.numPreguntasContestadas + 1);
        }, 4000);
  
        setTimeout(() => {
          this.mostrarModal();
        }, this.tiempoMostrarModal);
      }    
      else {
        setTimeout(() => {
          this.onClickCambiar();
        }, 5000);
      }
    }    
  }

  rellenarPregunta(numPregunta: number) {
    //console.log(numPregunta);
    setTimeout(() => {
      this.quitarSeleccionado();
      const PreguntaActual = this.listaDePreguntas[numPregunta - 1];
      this.preguntaTexto = PreguntaActual.pregunta.nombre;
      this.actualOpcionList = PreguntaActual.opcionList;
    }, 1000);
  }

  quitarSeleccionado() {
    const reiniciarSeleccionados: boolean[] = [];
    for (let i = 0; i < this.actualOpcionList.length; i++) {
      reiniciarSeleccionados.push(false);
    }
    this.botonSeleccionado = reiniciarSeleccionados;
  }

  reproducirSonido(nombreArchivo: string) {
    const audio = new Audio();
    audio.src = nombreArchivo;
    audio.load();
    audio.play();
  }

  //para el temporizador
  startMainTimer() {
    if (!this.isTimerRunning) {
      this.isTimerRunning = true; // Marca que el temporizador está en funcionamiento
      this.countdown = this.tiempoPregunta; // Restablece el tiempo en segundos
      this.mainTimerInterval = setInterval(() => {
        if (!this.userClicked) {
          this.countdown--; // Temporizador principal disminuye en segundos
        }
        if (this.countdown <= 0) {
          this.numPreguntasContestadas++;  

          if (this.isLife) {  
            if(!this.puedeResponder){
              this.preguntaBienContestada()  
            }         
                               
          }
          else{
            this.preguntaMalConstestada();
          }
          if(this.puedeResponder){
            console.log("No respondió");
            this.isLife=false;
            this.sendResultadoBD();
            this.userClickTime = new Date();
            this.preguntaMalConstestada();
            this.Mensaje_error = 'Se acabo el tiempo';
          }
          
          
          this.puedeResponder = false;
          this.userClicked = true;
          //this.preguntaMalConstestada();
          
          
          this.stopTimer();

          setTimeout(() => {
            this.getNumJugadoresMuertos();

          },1000);

          if(this.isLife || this.repetirPregunta){
            setTimeout(() => {
              this.pasarAOtraPregunta();
            }, 3000);
            
          }
          
          
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

    this.puntosJugador.idUsuario = this.idUsuario;
    this.puntosJugador.idSala = this.idSala;
    this.puntosJugador.puntaje = this.puntosGanados;
    this.puntosJugador.tiempo = this.tiempoDelJugador;

    //Cuando finalicé el juego directo a esta ventana
    this.musicaFondo?.pause();
    // @ts-ignore
    this.musicaFondo.currentTime = 0;
    //this.numVentanaH.emit(3); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
    this.guardarPuntaje(this.puntosJugador);
  }

  guardarPuntaje(puntosJugador: PuntosJugador) {
    this.usuarioSalaService.crearRanking(puntosJugador).subscribe({
      next: (data: any) => {
        let { info, error } = data.result;
        if (error > 0) {
          this.messageService.add({
            severity: 'error',
            summary: this.constantsService.mensajeError(),
            detail: 'ha ocurrido un error con la conexión',
          });
        } else {
          this.cambiarPag('/RankingChallengers', this.idSala);
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }


  cambiarPag(ruta: string, id: number) {
    let idSala = this.encryptionService.encrypt(id.toString());
    let params = { idSala };
    this.router.navigate([ruta], { queryParams: params });
  }
}
