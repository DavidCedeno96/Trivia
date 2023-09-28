import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-ventana-registro',
  templateUrl: './ventana-registro.component.html',
  styleUrls: ['./ventana-registro.component.css']
})
export class VentanaRegistroComponent {
  @Output() isLoginH = new EventEmitter<boolean>();

  // Método para cambiar el valor del booleano y emitir el evento
  onClickCambiar() {
    this.isLoginH.emit(true); // Puedes emitir 'true' o 'false' según tu lógica
  }

}
