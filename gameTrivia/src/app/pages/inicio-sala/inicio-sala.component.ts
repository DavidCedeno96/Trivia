import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
  ElementRef,
  ViewChild,
  AfterViewInit,
} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ConfirmationService } from 'primeng/api';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Sala } from 'src/app/model/SalaModel';
import { JuegoChallengerService } from 'src/app/services/juego-challenger.service';
import { SalaService } from 'src/app/services/sala.service';
import { UsuarioService } from 'src/app/services/usuario.service';

//import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-inicio-sala',
  templateUrl: './inicio-sala.component.html',
  styleUrls: ['./inicio-sala.component.css'],
  providers: [ConfirmationService],
})
export class InicioSalaComponent implements OnInit, AfterViewInit {
  //Temporizador para survivor
  private countdown: any = 10;
  public minutes: number = 3;
  public seconds: number = 0;
  private endDate: Date = new Date();

  @ViewChild('mi_imagen') miImagen: ElementRef | undefined;
  imagenEsHorizontal: boolean = true;
  //nombreSala: string = 'Mi sala!';
  //idSala: number = 0;
  //imagenSala: string = 'assets/Imagenes Juego/ImagenDefault.png';
  @Input() errorResultDataPregOpc: number = 0;
  existeError: boolean = false;
  result: string = '';

  idJugador: number = 0;
  iniciales: string = '';

  miSala: Sala = {
    idSala: 1,
    nombre: 'Mi primera sala',
    imagen: 'assets/Imagenes Juego/Imagen test.png',
    descripcion: 'Descripcion Sala',
    idModoJuego: 0,
    modoJuego: 'Challenger',
    estado: 1,
    totalPreguntas: 0,
    cantJugadas: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    fechaActivacion: new Date(),
  };

  msjChallenger = [
    '¡Bienvenido a Challenger!',
    'Contesta correctamente las preguntas para ganar puntos y avanza rápido para llegar primero a la meta. Tienes 20 segundos por pregunta, ¡Diviértete!',
  ];
  msjSurvivor = [
    '¡Bienvenido a Survivor!',
    'Responde cada pregunta en un lapso de 12 segundos; un error te elimina. Si todos los participantes activos cometen un fallo en el camino, tendrán una oportunidad adicional.  El juego comienza al agotarse el temporizador, ¡La victoria es tuya si eres el último en pie!',
  ];

  msjJuego = ['', ''];

  @Output() numVentanaH = new EventEmitter<number>();
  isFinalizoJuego: boolean = false; //Necesitamos obtener un valor si el jugador ya finalizó el juego

  //Para el juego de survivor
  fechaReferencia: Date = new Date();
  tiempoRestante: number = 0; // Tiempo en segundos
  tiempoTerminado: boolean = false;

  ngOnInit(): void {
    this.iniciales = this.obtenerIniciales(this.usuarioService.getUserName()!);
    this.idJugador = parseInt(this.usuarioService.getIdUsuario()!);
    this.route.queryParams.subscribe((params) => {
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '') {
        history.back();
      }
      this.miSala.idSala = parseInt(idSala);
    });
    this.cargarInfoSala(this.miSala.idSala, this.idJugador);

    //Recargar página hasta que se active el juego
    if (this.miSala.estado === 0) {
      this.constantsService.loading(true);
    } else {
      this.constantsService.loading(false);
    }
    //Para el modo Challenger
  }

  ngAfterViewInit(): void {
    this.calcularRelacionAspecto();
  }

  constructor(
    private salaServicio: SalaService,
    private router: Router,
    private route: ActivatedRoute,
    private confirmationService: ConfirmationService,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService,
    private juegoChallengerService: JuegoChallengerService,
    private usuarioService: UsuarioService
  ) {}

  cargarInfoSala(idSala: number, idUsuario: number) {
    this.salaServicio.itemSala(0, idSala, idUsuario).subscribe({
      next: (data: any) => {
        const { info, error, sala } = data.result;
        this.result = info;
        if (error > 0) {
          //hay error
          this.existeError = true;
        } else {
          //no hay error
          this.existeError = false;
          this.miSala = sala;
          //Cambiar mensaje de acuerdo al modo del juego
          if (this.miSala.modoJuego == 'Challenger') {
            this.msjJuego = this.msjChallenger;
            setInterval(() => {
              if (this.miSala.estado === 0) {
                //console.log('Reload');
                location.reload();
              }
            }, 10000); // 10000 milisegundos (10 segundos)
          }
          if (this.miSala.modoJuego == 'Supervivencia') {
            this.msjJuego = this.msjSurvivor;
            this.temporizador();
          }
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  //TEMPORIZADOR
  temporizador() {
    // Calcula la fecha de finalización sumando 3 minutos a la fecha actual.
    this.endDate = new Date(this.miSala.fechaActivacion);

    this.endDate.setMinutes(this.endDate.getMinutes() + this.minutes);

    // Función para actualizar el temporizador.
    const updateTimer = () => {
      const currentTime = new Date();
      const timeRemaining = this.endDate.getTime() - currentTime.getTime();

      // Calcula minutos y segundos restantes.
      this.minutes = Math.floor(timeRemaining / 60000);
      this.seconds = Math.floor((timeRemaining % 60000) / 1000);

      // Comprueba si el temporizador ha terminado.
      if (timeRemaining < 0) {
        // Puedes agregar aquí una acción para ejecutar cuando el temporizador haya finalizado.
        this.minutes = 0;
        this.seconds = 0;
      } else {
        // Llama a setTimeout para actualizar el temporizador cada segundo.
        this.countdown = setTimeout(updateTimer, 1000);
      }
    };

    // Inicializa el temporizador.
    updateTimer();
  }

  getImageSala(nombreImagen: string): string {
    let imageUrl = `${this.salaServicio.getURLImages()}/${nombreImagen}`;
    return imageUrl;
  }

  validarDataPregOpc() {
    if (this.errorResultDataPregOpc > 0) {
      this.confirmationService.confirm({
        message:
          'Posibles errores: la sala no tiene preguntas, las preguntas no tienen opciones o la sala no existe',
        header: 'Hay errores en la lista de preguntas y opciones',
        accept: () => {},
      });
    } else {
      this.createPosicion();
      this.onClickCambiar();
    }
  }

  onClickCambiar() {
    if (!this.isFinalizoJuego) {
      this.numVentanaH.emit(2); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
    }
    if (this.isFinalizoJuego) {
      this.numVentanaH.emit(3); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
    }
  }

  onClickCambiarTest() {
    //this.numVentanaH.emit(3); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
    this.router.navigate(['/MisSalas']);
  }

  createPosicion() {
    let juego = {
      idSala: this.miSala.idSala,
      idJugador: this.idJugador,
      iniciales: this.iniciales,
      posicion: 0,
    };

    this.juegoChallengerService.createItem(juego).subscribe({
      next: (data: any) => {
        let { error } = data.result;
        return error;
      },
      error: (e) => {
        console.log(e);
        return 1;
      },
    });
  }

  obtenerIniciales(nombre: string) {
    // Divide el nombre en palabras utilizando espacio como separador
    const palabras = nombre.split(' ');

    // Verifica si hay al menos una palabra en el nombre
    if (palabras.length >= 1) {
      // Inicializa una variable para almacenar las iniciales
      let iniciales = '';
      if (palabras.length > 1) {
        // Recorre las palabras y obtiene las iniciales de las dos primeras
        for (let i = 0; i < Math.min(palabras.length, 2); i++) {
          const palabra = palabras[i];
          if (palabra.length > 0) {
            iniciales += palabra[0].toUpperCase();
          }
        }
      } else {
        for (let i = 0; i < palabras.length; i++) {
          const palabra = palabras[i];
          if (palabra.length > 0) {
            iniciales += palabra[0].toUpperCase();
          }
        }
      }
      return iniciales;
    } else {
      // En caso de que el nombre esté vacío o no contenga palabras
      return '';
    }
  }

  // myForm: FormGroup;
  // submitted = false; // Agrega la propiedad "submitted" y inicialízala en falso

  /*   constructor(private fb: FormBuilder, private cdr: ChangeDetectorRef) {
    this.myForm = this.fb.group({
      inputName: ['', Validators.required],
      inputZip: ['', Validators.required],
    });
  } */

  /*  onSubmit() {
    this.submitted = true; 
    this.cdr.detectChanges();
    if (this.myForm.invalid) {      
      return;
    }   
  } */

  calcularRelacionAspecto() {
    //console.log(this.miImagen);
    if (this.miImagen && this.miImagen.nativeElement) {
      const img = this.miImagen.nativeElement;
      img.onload = () => {
        const ancho = img.width;
        const alto = img.height;
        //console.log(`Ancho: ${ancho}px, Alto: ${alto}px`);
        this.imagenEsHorizontal = ancho < alto;
      };
      //img.src = this.imagenSala; // Asegúrate de que la imagen esté cargada antes de obtener sus dimensiones
    }
  }
}
