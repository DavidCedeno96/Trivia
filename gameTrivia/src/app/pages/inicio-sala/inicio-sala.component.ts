import { Component, EventEmitter, Output } from '@angular/core';
//import { FormBuilder, FormGroup, Validators } from '@angular/forms';


@Component({
  selector: 'app-inicio-sala',
  templateUrl: './inicio-sala.component.html',
  styleUrls: ['./inicio-sala.component.css']
})
export class InicioSalaComponent {

  nombreSala: string = "Mi sala";
  idSala: number = 0;
  imagenSala: string = "assets/Imagenes Juego/ImagenDefault.png";

  @Output() numVentanaH = new EventEmitter<number>();
  isFinalizoJuego: boolean = false; //Necesitamos obtener un valor si el jugador ya finalizó el juego

  onClickCambiar() {
    if(!this.isFinalizoJuego){
      this.numVentanaH.emit(2); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados
    }
    if(this.isFinalizoJuego){
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