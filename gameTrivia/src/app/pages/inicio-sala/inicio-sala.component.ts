import { Component, ChangeDetectorRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';


@Component({
  selector: 'app-inicio-sala',
  templateUrl: './inicio-sala.component.html',
  styleUrls: ['./inicio-sala.component.css']
})
export class InicioSalaComponent {

  nombreSala: string = "Mi sala";
  idSala: number = 0;

  myForm: FormGroup;
  submitted = false; // Agrega la propiedad "submitted" y inicialízala en falso



  constructor(private fb: FormBuilder, private cdr: ChangeDetectorRef) {
    this.myForm = this.fb.group({
      inputName: ['', Validators.required],
      inputZip: ['', Validators.required],
    });
  }

  onSubmit() {
    this.submitted = true; // Cuando se hace clic en el botón de envío, establece "submitted" en verdadero
    this.cdr.detectChanges();
    if (this.myForm.invalid) {
      // Si el formulario es inválido, no hagas nada aquí o muestra un mensaje de error personalizado
      return;
    }

    // Continúa con la lógica para enviar el formulario si es válido
  }
}