import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css'],
})
export class AdminComponent implements OnInit {
  misSalas: Sala[] = [];
  existeError: boolean = false;
  result: string = '';

  constructor(private salaServicio: SalaService, private router: Router) {}

  ngOnInit(): void {
    this.salaServicio.listaSala(0).subscribe({
      next: (data: any) => {
        const { info, error, lista } = data.result;
        this.result = info;
        if (error > 0) {
          // hay error
          this.existeError = true;
        } else {
          // no hay error
          this.existeError = false;
          this.misSalas = lista;
        }
      },
      error: (e) => {
        //console.log(e);
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  getImageSala(nombreImagen: string): string {
    let image = `${this.salaServicio.getURLImages()}/${nombreImagen}`;
    console.log(image);
    return image;
  }
}
