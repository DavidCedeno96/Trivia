import { Component, HostListener,  Renderer2, ElementRef, OnInit, ViewChild  } from '@angular/core';
import { Opcion, Pregunta, Pregunta_OpcionList } from 'src/app/model/SalaModel';

declare var bootstrap: any;


@Component({
  selector: 'app-challengers-game',
  templateUrl: './challengers-game.component.html',
  styleUrls: ['./challengers-game.component.css']
})
export class ChallengersGameComponent {

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
    idOpcion: 1,
    nombre: "Primera opción para responder a la pregunta",
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

  numPreguntaActual: number = 0;
  preguntaTexto: string = "";
  opcion1 = {texto: "", isCorrect: false};
  opcion2 = {texto: "", isCorrect: false};
  opcion3 = {texto: "", isCorrect: false};
  opcion4 = {texto: "", isCorrect: false};
  

  constructor(private renderer: Renderer2, private el: ElementRef) {

    //Test para las preguntas
    for (let index = 0; index < this.cantidadDeBotones; index++) {
      this.listaDePreguntas.push(this.preguntaOpcionActual);      
    }

    this.updateCenters(window.innerWidth);
    this.generateButtons();
    this.numImagenesColocadas = 0;    
  }

  ngOnInit(){
    setTimeout(() => {
      this.mostrarModal();
      console.log("Entro");
    },5000);     

  }

  rellenarPregunta(numPregunta:number){
    setTimeout(() => {
      const PreguntaActual = this.listaDePreguntas[numPregunta-1]
      this.preguntaTexto=PreguntaActual.pregunta.nombre;
      this.opcion1={texto: PreguntaActual.opcionList[0].nombre, isCorrect: PreguntaActual.opcionList[0].correcta==1};
      if (PreguntaActual.opcionList.length<3) {
                
      }
      this.mostrarModal();
      console.log("Entro");
    },1000);   

  }

  mostrarModal() {
    this.modalElement = this.el.nativeElement.querySelector('#exampleModal');
    this.modal = new bootstrap.Modal(this.modalElement);
    this.modal.show();
  }

  closeModal() {
    this.mostrarAlert = true;
    setTimeout(() => {
      this.mostrarAlert = false;     
      this.modal.hide();
    }, 3000); // 3000 milisegundos = 3 segundos
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
      const rutaSelect = this.imagenes[this.numImagenesColocadas-1];    
      this.botones.push({ id: 'imagen-' + i, x, y, svg:"", tipo: 'imagen', rutaImagen: rutaSelect });
    }else{
      this.botones.push({ id: i,  x, y, svg: this.svgInactivo, tipo: "boton", rutaImagen: "" });

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
        case 2:
          boton.svg=this.svgInactivo;
          break;
        case 3:
          boton.svg=this.svgVisitado;
          break;
        default:
          boton.svg=this.svgActivo;
          break;
      }
      //boton.activo = !boton.activo; // Cambia el estado activo al hacer clic
      // Hacer scroll hacia el botón activado
      const buttonElement = this.el.nativeElement.querySelector(`#boton-${id}`);
      if (buttonElement) {
        buttonElement.scrollIntoView({ behavior: 'smooth' }); // Hace scroll suavemente
      }
    }
  }

}