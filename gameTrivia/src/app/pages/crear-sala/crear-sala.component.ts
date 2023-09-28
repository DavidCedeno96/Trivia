import { Component } from '@angular/core';

@Component({
  selector: 'app-crear-sala',
  templateUrl: './crear-sala.component.html',
  styleUrls: ['./crear-sala.component.css']
})
export class CrearSalaComponent {
  selectedCard: string | null = null; // Inicialmente, ninguna tarjeta está seleccionada

  selectCard(id: string) {
    this.selectedCard = id; // Cambia la tarjeta seleccionada al hacer clic
  }

}
