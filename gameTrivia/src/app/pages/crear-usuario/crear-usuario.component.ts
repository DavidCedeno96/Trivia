import { Component } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Usuario } from 'src/app/model/UsuarioModel';

@Component({
  selector: 'app-crear-usuario',
  templateUrl: './crear-usuario.component.html',
  styleUrls: ['./crear-usuario.component.css']
})
export class CrearUsuarioComponent {

  selectedCard: number = 0; // Inicialmente, ninguna tarjeta está seleccionada
  notSelectCard: boolean = false;
  selectedFile: File | null = null;
  type: string = '';
  //imageSala: string = '';
  titulo: string = '';

  existeError: boolean = false;
  result: string = '';

  nombreInput: FormControl;
  dpiInput: FormControl;
  correoInput: FormControl;

  RolSeleccionado = 1;

 /*  nuevoUsuario: Usuario = {
    idUsuario: 0,
    nombre: "Marcela Confiable",
    correo: "mconfiable@cmi.com",
    contrasena: "",//contraseña o DPI
    idRol: 0,
    iniciales: "MC", }; */
    nuevoUsuario: Usuario = {
      idUsuario: 0,
      nombre: "",
      correo: "",
      contrasena: "",//contraseña o DPI
      idRol: 0,
      iniciales: "MC",
    };

 

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService
  ) {
    this.nombreInput = new FormControl('', [
      Validators.required,
      Validators.maxLength(20),
    ]);
    this.dpiInput = new FormControl('', [      
      
    ]);

    this.correoInput = new FormControl('', [      
      
    ]);
  }

  ngOnInit(): void {
   /*  this.route.queryParams.subscribe((params) => {
      this.type = params['type'];
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '' && this.type === 'editar') {
        history.back();
      }
      if (this.type === 'editar') {
        this.nuevoUsuario.idUsuario = parseInt(idSala);
      }
    });
    switch (this.type) {
      case 'crear': {
        this.titulo = 'Crear Sala';
        break;
      }
      case 'editar': {
        this.constantsService.loading(true);
        this.titulo = 'Editar Sala';
        this.cargarData(this.nuevoUsuario.idUsuario);
        break;
      }
      default: {
        this.titulo = '';
        this.router.navigate(['/Administrador']);
        break;
      }
    } */
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
    this.constantsService.loading(true);
    switch (this.type) {
      case 'crear': {
        if (this.validForm()) {
          this.crearNuevaSala();
        }
        break;
      }
      case 'editar': {
        if (this.validForm()) {
          this.editarSala();
        }
        break;
      }
      default: {
        this.router.navigate(['/Administrador']);
        break;
      }
    }
  }

  cargarData(idSala: number) {
    /* this.salaServicio.itemSala(0, idSala, 0).subscribe({
      next: (data: any) => {
        const { info, error, sala } = data.result;
        this.result = info;
        console.log(this.result);
        if (error > 0) {
          //hay error
          this.existeError = true;
        } else {
          //no hay error
          this.existeError = false;
          this.nuevaSala = sala;
          
          if (this.nuevaSala.descripcion === 'N/A') {
            this.nuevaSala.descripcion = '';
          }
          this.selectedCard = this.nuevaSala.idModoJuego;
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        } else if (e.status == 400) {
          history.back();
        }
      },
    }); */
  }

  crearNuevaSala() {
    const formData = new FormData();
    formData.append('nombre', this.nuevoUsuario.nombre.trim());
    formData.append('contrasena', this.nuevoUsuario.contrasena.trim());
    formData.append('correo', this.nuevoUsuario.correo.trim());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }

   /*  this.salaServicio.crearSala(formData).subscribe({
      next: (data: any) => {
        const { info, error, campo } = data.result;
        this.result = info;
        //console.log(info, campo);
        if (error > 0) {
          this.result += '_' + campo;
          this.existeError = true;
        } else {
          this.existeError = false;
          this.router.navigate(['/GestionarUsuarios']);
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        //console.log(e);
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    }); */
  }

  editarSala() {
    const formData = new FormData();
    formData.append('idSala', this.nuevoUsuario.idUsuario.toString());
    formData.append('nombre', this.nuevoUsuario.nombre.trim());
    formData.append('contrasena', this.nuevoUsuario.contrasena.trim());
    formData.append('correo', this.nuevoUsuario.correo.trim());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }
   /*  this.salaServicio.editarSala(formData).subscribe({
      next: (data: any) => {
        const { info, error, campo } = data.result;
        this.result = info;
        console.log(info, campo);
        if (error > 0) {
          this.existeError = true;
        } else {
          this.existeError = false;
          this.router.navigate(['/GestionarUsuarios']);
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        //console.log(e);
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    }); */
  }

  validForm(): boolean {
    let isValid: boolean = true;
    if (this.nombreInput.hasError('maxlength')) {
      isValid = false;
    }

    if (this.dpiInput.hasError('maxlength')) {
      isValid = false;
    }

    if (!isValid) {
      this.constantsService.loading(false);
    }
    return isValid;
  }
}


  

