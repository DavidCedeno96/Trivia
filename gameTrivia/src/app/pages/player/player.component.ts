import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';

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

  constructor(private router: Router, private salaServicio: SalaService) {}

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
}
