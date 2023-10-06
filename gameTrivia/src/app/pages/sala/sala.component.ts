import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Pregunta, Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';

@Component({
  selector: 'app-sala',
  templateUrl: './sala.component.html',
  styleUrls: ['./sala.component.css'],
})
export class SalaComponent implements OnInit {
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

  preguntasSala: Pregunta[] = [
    {
      idPregunta: 1,
      nombre:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
      estado: 1,
    },
    {
      idPregunta: 2,
      nombre:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
      estado: 1,
    },
  ];

  constructor(
    private salaServicio: SalaService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.miSala.idSala = params['idSala'];
    });
  }

  cargarData(idSala: number) {
    this.salaServicio.itemSala(0, idSala).subscribe({
      next: (data: any) => {
        const { info, error, sala } = data.result;
        this.result = info;
        if (error > 0) {
          //hay error
        } else {
          //no hay error
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
  //  const salaEncontrada = salas.find((sala) => sala.idSala === idSala);
}
