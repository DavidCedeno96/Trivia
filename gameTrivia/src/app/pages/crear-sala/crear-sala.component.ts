import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';

@Component({
  selector: 'app-crear-sala',
  templateUrl: './crear-sala.component.html',
  styleUrls: ['./crear-sala.component.css'],
})
export class CrearSalaComponent implements OnInit {
  selectedCard: number = 0; // Inicialmente, ninguna tarjeta está seleccionada
  notSelectCard: boolean = false;
  selectedFile: File | null = null;
  type: string = '';
  //imageSala: string = '';
  titulo: string = '';

  existeError: boolean = false;
  result: string = '';

  nuevaSala: Sala = {
    idSala: 1,
    nombre: '',
    imagen: '',
    descripcion: '',
    idModoJuego: 0,
    modoJuego: '',
    estado: 1,
    fecha_creacion: '',
    fecha_modificacion: '',
  };

  constructor(
    private salaServicio: SalaService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.type = params['type'];
      this.nuevaSala.idSala = params['idSala'];
    });
    switch (this.type) {
      case 'crear': {
        this.titulo = 'Crear Sala';
        break;
      }
      case 'editar': {
        this.titulo = 'Editar Sala';
        this.cargarData(this.nuevaSala.idSala);
        break;
      }
      default: {
        this.titulo = '';
        this.router.navigate(['/Administrador']);
        break;
      }
    }
  }

  selectCard(id: number) {
    this.selectedCard = id; // Cambia la tarjeta seleccionada al hacer clic
    this.notSelectCard = false;
  }

  onFileSelected(event: any) {
    this.selectedFile = event.target.files[0];
    console.log(this.selectedFile?.name);
  }

  UpsertSala() {
    if (this.selectedCard === 0) {
      this.notSelectCard = true;
      return;
    }

    switch (this.type) {
      case 'crear': {
        this.crearNuevaSala();
        break;
      }
      case 'editar': {
        this.editarSala();
        break;
      }
      default: {
        this.router.navigate(['/Administrador']);
        break;
      }
    }
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
          this.nuevaSala = sala;
          /* this.imageSala = `${this.salaServicio.getURLImages()}/${
            this.nuevaSala.imagen
          }`; */
          if (this.nuevaSala.descripcion === 'N/A') {
            this.nuevaSala.descripcion = '';
          }
          this.selectedCard = this.nuevaSala.idModoJuego;
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  crearNuevaSala() {
    const formData = new FormData();
    formData.append('nombre', this.nuevaSala.nombre.trim());
    formData.append('descripcion', this.nuevaSala.descripcion.trim());
    formData.append('idModoJuego', this.selectedCard.toString());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }

    this.salaServicio.crearSala(formData).subscribe({
      next: (data: any) => {
        const { info, error, campo } = data.result;
        this.result = info;
        //console.log(info, campo);
        if (error > 0) {
          this.existeError = true;
        } else {
          this.existeError = false;
          this.router.navigate(['/Administrador']);
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

  editarSala() {
    const formData = new FormData();
    formData.append('idSala', this.nuevaSala.idSala.toString());
    formData.append('nombre', this.nuevaSala.nombre.trim());
    formData.append('descripcion', this.nuevaSala.descripcion.trim());
    formData.append('idModoJuego', this.selectedCard.toString());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }
    this.salaServicio.editarSala(formData).subscribe({
      next: (data: any) => {
        const { info, error, campo } = data.result;
        this.result = info;
        console.log(info, campo);
        if (error > 0) {
          this.existeError = true;
        } else {
          this.existeError = false;
          this.router.navigate(['/Administrador']);
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
}
