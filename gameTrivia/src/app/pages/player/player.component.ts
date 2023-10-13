import { Component, ElementRef } from '@angular/core';
import { Router } from '@angular/router';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';

declare var bootstrap: any;

@Component({
  selector: 'app-player',
  templateUrl: './player.component.html',
  styleUrls: ['./player.component.css'],
})
export class PlayerComponent {
  misSalas: Sala[] = [];
  textoBuscar: string = '';
  existeError: boolean = false;
  result: string = '';
  idSalaSeleccionada: number | null = null;

  modalElement: any;
  modal: any;

  constructor(private router: Router, private salaServicio: SalaService, private el: ElementRef) {
    //this.modalElement = this.el.nativeElement.querySelector('#exampleModal');
    //this.modal = new bootstrap.Modal(this.modalElement);
  }

  buscar() {
    if (this.textoBuscar.trim() !== '') {
      this.salaServicio.listaSalaSearch(1, this.textoBuscar.trim()).subscribe({
        next: (data: any) => {
          const { info, error, lista } = data.result;
          this.result = info;
          if (error > 0) {
            this.existeError = true;
          } else {
            this.existeError = false;
            this.misSalas = lista;
          }
        },
        error: (e) => {
          if (e.status === 401) {
            this.router.navigate(['/']);
          }
        },
      });
    }
  }

  getImageSala(nombreImagen: string): string {
    let imageUrl = `${this.salaServicio.getURLImages()}/${nombreImagen}`;
    return imageUrl;
  }

  abrirModal(idSala: number) {
    this.idSalaSeleccionada = idSala;
  }

  ingresarSala() {
    // Aquí puedes agregar la lógica para verificar si el código es correcto
    if (this.codigoIngresadoEsCorrecto()) {
      // Navega a la sala con los query params
      this.router.navigate(['/EntradaSala'], { queryParams: { idSala: this.idSalaSeleccionada } });
      // Cierra el modal
      this.modal.hide();
      //document.getElementById('exampleModal')?.click();
      
    } else {
      // Muestra un mensaje de error o realiza otra acción si el código no es correcto
    }
  }
  
  codigoIngresadoEsCorrecto(): boolean {
    // Aquí debes implementar la lógica para verificar si el código es correcto
    return true; // Reemplaza esto con tu lógica real
  }
}
