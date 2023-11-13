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

  /* misSalas: Sala[] = [];
  auxMisSalas: Sala[] = []; */
  Usuarios: Usuario[] = [{
    idUsuario: 0,
    nombre: "Marcela Confiable",
    correo: "mconfiable@cmi.com",
    contrasena: "",//contraseña o DPI
    idRol: 0,
    iniciales: "MC", },
    {
      idUsuario: 0,
      nombre: "Juan Honesto",
      correo: "",
      contrasena: "1264579854123",//contraseña o DPI
      idRol: 0,
      iniciales: "MC", }    
  ];
  existeError: boolean = false;
  result: string = '';
  textoBuscar: string = '';
  idRol: number = 0;

  currentURL: string = '';
  currentCodigo: string = '';

  timeLondon: string = '';



  constructor(
    private router: Router,
    private usuarioServicio: UsuarioService,
    private confirmationService: ConfirmationService,
    private messageService: MessageService,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService,
  ) {}

  ngOnInit(): void {
    //this.constantsService.loading(true);
    this.idRol = parseInt(this.usuarioServicio.getRol()!);
    
  }




  buscar() {
/*     if (this.textoBuscar.trim() !== '') {
      this.constantsService.loading(true);
      this.salaServicio.listaSalaSearch(0, this.textoBuscar.trim()).subscribe({
        next: (data: any) => {
          const { info, error, lista } = data.result;
          this.result = info;
          if (error > 0) {
            this.existeError = true;
          } else {
            this.existeError = false;
            this.misSalas = lista;
            this.messageService.add({
              severity: 'success',
              summary: this.constantsService.mensajeSatisfactorio(),
              detail: 'Sala/s Entontrada/s',
            });
          }
          this.constantsService.loading(false);
        },
        error: (e) => {
          if (e.status === 401) {
            this.router.navigate(['/']);
          }
        },
      });
    } else {
      this.misSalas = this.auxMisSalas;
    } */
  }

   verUsuariosAll(event: Event) {

    /* const valueText = (event.target as HTMLInputElement).value;
    if (valueText.trim() === '') {
      this.misSalas = this.auxMisSalas;
    } */
  } 


/* 
  allCopySala() {
    const textos = [
      'Cuando estés logueado en nuestra página de trivias, puedes ingresar directamente a la sala a través del link proporcionado. También puedes utilizar el buscador en la página principal, introduciendo el nombre de la sala y después introduces el código de la sala para acceder.',
      '',
      'Link de la Sala: ' + this.currentURL,
      'Nombre de la Sala: ' + this.salaItem.nombre,
      'Código de Sala: ' + this.currentCodigo,
    ];
    const textoAConcatenar = textos.join('\n');
    //this._clipboardService.copy(textoAConcatenar);
    if (navigator.clipboard) {
      navigator.clipboard
        .writeText(textoAConcatenar)
        .then(() => {
          //alert('Texto copiado al portapapeles.');
        })
        .catch((err) => {
          console.error('Error al copiar al portapapeles:', err);
          this._clipboardService.copyFromContent(textoAConcatenar);
          // alert('Texto copiado al portapapeles utilizando ngx-clipboard.');
        });
    } else {
      this._clipboardService.copyFromContent(textoAConcatenar);
      //alert('Texto copiado al portapapeles utilizando ngx-clipboard.');
    }
  } */


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
      message: '¿Seguro desea eliminar usuario?',
      header: 'Confirmación Eliminar',
      accept: () => this.eliminarSala(idSala),
    });
  }

  cambiarPag(ruta: string, id: number) {
   /*  this.closeModal.nativeElement.click();
    let idSala = this.encryptionService.encrypt(id.toString());
    let params = { idSala };
    this.router.navigate([ruta], { queryParams: params }); */
  }

  cerrarSesion() {
    this.usuarioServicio.logout();
  }
}
