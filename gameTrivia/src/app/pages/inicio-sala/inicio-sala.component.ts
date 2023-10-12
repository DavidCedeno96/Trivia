import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';
//import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-inicio-sala',
  templateUrl: './inicio-sala.component.html',
  styleUrls: ['./inicio-sala.component.css'],
})
export class InicioSalaComponent implements OnInit {
  //nombreSala: string = 'Mi sala!';
  //idSala: number = 0;
  //imagenSala: string = 'assets/Imagenes Juego/ImagenDefault.png';
  existeError: boolean = false;
  result: string = '';

  miSala: Sala = {
    idSala: 1,
    nombre: 'Mi primera sala',
    imagen: 'assets/Imagenes Juego/Imagen test.png',
    descripcion: 'Descripcion Sala',
    idModoJuego: 0,
    modoJuego: 'Challenger',
    estado: 1,
    fecha_creacion: '',
    fecha_modificacion: '',
  };

  @Output() numVentanaH = new EventEmitter<number>();
  isFinalizoJuego: boolean = false; //Necesitamos obtener un valor si el jugador ya finalizó el juego

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.miSala.idSala = params['idSala'];
    });
    this.cargarInfoSala(this.miSala.idSala);
  }

  constructor(
    private salaServicio: SalaService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  cargarInfoSala(idSala: number) {
    this.salaServicio.itemSala(0, idSala).subscribe({
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
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  getImageSala(nombreImagen: string): string {
    let imageUrl = `${this.salaServicio.getURLImages()}/${nombreImagen}`;
    return imageUrl;
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
    this.numVentanaH.emit(3); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
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
}
