import { Component, ElementRef, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { ConfirmationService, MessageService } from 'primeng/api';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Usuario } from 'src/app/model/UsuarioModel';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-gestionar-usuarios',
  templateUrl: './gestionar-usuarios.component.html',
  styleUrls: ['./gestionar-usuarios.component.css'],
  providers: [ConfirmationService, MessageService],
})
export class GestionarUsuariosComponent {
  @ViewChild('closeModal') closeModal!: ElementRef;

  auxUsuarios: Usuario[] = [];
  Usuarios: Usuario[] = [];
  existeError: boolean = false;
  result: string = '';
  textoBuscar: string = '';

  currentURL: string = '';
  currentCodigo: string = '';

  timeLondon: string = '';

  constructor(
    private router: Router,
    private usuarioServicio: UsuarioService,
    private confirmationService: ConfirmationService,
    private messageService: MessageService,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService
  ) {}

  ngOnInit(): void {
    this.constantsService.loading(true);
    this.listarUsuarios('', true);
  }

  listarUsuarios(buscar: string, cargaInicial: boolean) {
    this.usuarioServicio.listaUsuario(0, buscar).subscribe({
      next: (data: any) => {
        let { error, info, lista } = data.result;
        this.result = info;
        this.existeError = error;
        if (error === 0) {
          this.Usuarios = lista;
          if (cargaInicial) {
            this.auxUsuarios = lista;
          }
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401 || e.status === 403) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  buscar() {
    this.constantsService.loading(true);
    this.listarUsuarios(this.textoBuscar, false);
  }

  verUsuariosAll(event: Event) {
    const valueText = (event.target as HTMLInputElement).value;
    if (valueText.trim() === '') {
      this.Usuarios = this.auxUsuarios;
    }
  }

  eliminarSala(idSala: number) {
    this.constantsService.loading(true);
    /*  this.salaServicio.eliminarSala(idSala).subscribe({
      next: (data: any) => {
        const { info, error } = data.result;
        this.result = info;
        if (error > 0) {
          this.existeError = true;
          this.messageService.add({
            severity: 'error',
            summary: this.constantsService.mensajeError(),
            detail: 'No se pudo eliminar la sala',
          });
        } else {
          this.existeError = false;
          this.cargarSalas();
          this.messageService.add({
            severity: 'success',
            summary: this.constantsService.mensajeSatisfactorio(),
            detail: 'Sala eliminada',
          });
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    }); */
  }

  confirmEliminar(idSala: number) {
    this.confirmationService.confirm({
      message: '¿Seguro desea eliminar el usuario?',
      header: 'Confirmación Eliminar',
      accept: () => this.eliminarSala(idSala),
    });
  }

  cambiarPag(ruta: string, type: string, id1: number) {
    let idUsuario = this.encryptionService.encrypt(id1.toString());
    let params = { type, idUsuario };
    this.router.navigate([ruta], { queryParams: params });
  }

  cerrarSesion() {
    this.usuarioServicio.logout();
  }
}
