import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-ventana-login',
  templateUrl: './ventana-login.component.html',
  styleUrls: ['./ventana-login.component.css']
})
export class VentanaLoginComponent {
  @Output() isLoginH = new EventEmitter<boolean>();

  // Método para cambiar el valor del booleano y emitir el evento
  onClickCambiar() {
    this.isLoginH.emit(false); // Puedes emitir 'true' o 'false' según tu lógica
  }

}
