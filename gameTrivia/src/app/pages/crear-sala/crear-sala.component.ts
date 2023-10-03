import { Component } from '@angular/core';
import { data } from 'jquery';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';

@Component({
  selector: 'app-crear-sala',
  templateUrl: './crear-sala.component.html',
  styleUrls: ['./crear-sala.component.css'],
})
export class CrearSalaComponent {
  selectedCard: number = 0; // Inicialmente, ninguna tarjeta está seleccionada
  notSelectCard: boolean = false;
  selectedFile: File | null = null;

  nuevaSala: Sala = {
    idSala: 1,
    nombre: '',
    imagen: '',
    descripcion: '',
    idModoJuego: '',
    estado: 1,
  };

  constructor(private salaServicio: SalaService) {}

  selectCard(id: number) {
    this.selectedCard = id; // Cambia la tarjeta seleccionada al hacer clic
    this.notSelectCard = false;
  }

  onFileSelected(event: any) {
    this.selectedFile = event.target.files[0];
  }

  CrearSala() {
    if (this.selectedCard === 0) {
      this.notSelectCard = true;
      return;
    }

    const formData = new FormData();
    formData.append('nombre', this.nuevaSala.nombre);
    formData.append('descripcion', this.nuevaSala.descripcion);
    formData.append('idModoJuego', this.selectedCard.toString());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }

    this.salaServicio.crearUsuario(formData).subscribe({
      next: (data: any) => {
        console.log(data);
      },
      error: (e) => {
        console.log(e);
      },
    });

    console.log(formData.getAll('file'));
  }
}
