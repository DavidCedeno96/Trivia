import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ConfirmationService, MessageService } from 'primeng/api';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css'],
  providers: [ConfirmationService, MessageService],
})
export class AdminComponent implements OnInit {
  misSalas: Sala[] = [];
  existeError: boolean = false;
  result: string = '';
  textoBuscar: string = '';

  constructor(
    private salaServicio: SalaService,
    private usuarioServicio: UsuarioService,
    private router: Router,
    private confirmationService: ConfirmationService,
    private messageService: MessageService
  ) {}

  ngOnInit(): void {
    this.cargarSalas();
  }

  cargarSalas() {
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

  buscar() {
    console.log(this.textoBuscar);
  }

  getImageSala(nombreImagen: string): string {
    let imageUrl = `${this.salaServicio.getURLImages()}/${nombreImagen}`;
    return imageUrl;
  }

  eliminarSala(idSala: number) {
    this.salaServicio.eliminarSala(idSala).subscribe({
      next: (data: any) => {
        const { info, error } = data.result;
        this.result = info;
        if (error > 0) {
          this.existeError = true;
          this.messageService.add({
            severity: 'error',
            summary: 'Error',
            detail: 'No se pudo eliminar la sala',
          });
        } else {
          this.existeError = false;
          this.cargarSalas();
          this.messageService.add({
            severity: 'success',
            summary: 'Satisfactorio',
            detail: 'Sala eliminada',
          });
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  confirmEliminar(idSala: number) {
    this.confirmationService.confirm({
      message: '¿Seguro desea eliminar la sala?',
      header: 'Confirmación Eliminar',
      accept: () => this.eliminarSala(idSala),
    });
  }

  cerrarSesion() {
    this.usuarioServicio.logout();
  }
}
