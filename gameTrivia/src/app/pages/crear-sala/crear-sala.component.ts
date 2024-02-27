import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Sala } from 'src/app/model/SalaModel';
import { SalaService } from 'src/app/services/sala.service';
import { TimeApiService } from 'src/app/services/time-api.service';

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

  nombreInput: FormControl;
  descripcionInput: FormControl;

  tiemposXPregunta: number[] = [15, 20, 30, 40, 50, 60];

  nuevaSala: Sala = {
    idSala: 1,
    nombre: '',
    imagen: '',
    descripcion: '',
    idModoJuego: 0,
    modoJuego: '',
    estado: 1,
    totalPreguntas: 0,
    cantJugadas: 0,
    tiempoXpregunta: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    fechaActivacion: '',
    fechaCierre: '',
    fechaCierreLondon: '',
  };

  date: Date | undefined;

  constructor(
    private timeServicio: TimeApiService,
    private salaServicio: SalaService,
    private router: Router,
    private route: ActivatedRoute,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService
  ) {
    this.nombreInput = new FormControl('', [
      Validators.required,
      Validators.maxLength(50),
    ]);
    this.descripcionInput = new FormControl('', [
      Validators.required,
      Validators.maxLength(200),
    ]);
  }

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      this.type = params['type'];
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '' && this.type === 'editar') {
        history.back();
      }
      if (this.type === 'editar') {
        this.nuevaSala.idSala = parseInt(idSala);
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
    this.salaServicio.itemSala(0, idSala, 0).subscribe({
      next: (data: any) => {
        const { info, error, sala } = data.result;
        this.result = info;
        if (error > 0) {
          //hay error
          this.existeError = true;
        } else {
          //no hay error
          this.existeError = false;
          this.date = new Date(sala.fechaCierre);
          this.nuevaSala = sala;
          /* this.imageSala = `${this.salaServicio.getURLImages()}/${
            this.nuevaSala.imagen
          }`; */
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
    });
  }

  crearNuevaSala() {
    this.nuevaSala.fechaCierre = this.setFecha(this.date?.toString()!);
    this.timeServicio.convertToLondonTime(this.date!).subscribe({
      next: (dataDate: any) => {
        const formData = new FormData();
        formData.append('nombre', this.nuevaSala.nombre.trim());
        formData.append('descripcion', this.nuevaSala.descripcion.trim());
        formData.append('idModoJuego', this.selectedCard.toString());
        formData.append(
          'tiempoXpregunta',
          this.nuevaSala.tiempoXpregunta.toString()
        );
        formData.append('fechaCierre', this.nuevaSala.fechaCierre);
        formData.append('fechaCierreLondon', this.setFecha(dataDate));
        if (this.selectedFile) {
          formData.append('archivo', this.selectedFile);
        }

        this.salaServicio.crearSala(formData).subscribe({
          next: (data: any) => {
            const { info, error, campo } = data.result;
            this.result = info;
            //console.log(info, campo);
            if (error > 0) {
              this.result += '_' + campo;
              this.existeError = true;
            } else {
              this.existeError = false;
              this.router.navigate(['/Administrador']);
            }
            this.constantsService.loading(false);
          },
          error: (e) => {
            //console.log(e);
            if (e.status === 401) {
              this.router.navigate(['/']);
            }
          },
        });
      },
      error: (e) => {
        console.error(e);
        this.router.navigate(['/Administrador']);
      },
    });
  }

  editarSala() {
    this.nuevaSala.fechaCierre = this.setFecha(this.date?.toString()!);
    this.timeServicio.convertToLondonTime(this.date!).subscribe({
      next: (dataDate: any) => {
        const formData = new FormData();
        formData.append('idSala', this.nuevaSala.idSala.toString());
        formData.append('nombre', this.nuevaSala.nombre.trim());
        formData.append('descripcion', this.nuevaSala.descripcion.trim());
        formData.append('idModoJuego', this.selectedCard.toString());
        formData.append(
          'tiempoXpregunta',
          this.nuevaSala.tiempoXpregunta.toString()
        );
        formData.append('fechaCierre', this.nuevaSala.fechaCierre);
        formData.append('fechaCierreLondon', this.setFecha(dataDate));
        if (this.selectedFile) {
          formData.append('archivo', this.selectedFile);
        }

        this.salaServicio.editarSala(formData).subscribe({
          next: (data: any) => {
            const { info, error, campo } = data.result;
            this.result = info;
            if (error > 0) {
              this.existeError = true;
            } else {
              this.existeError = false;
              this.router.navigate(['/Administrador']);
            }
            this.constantsService.loading(false);
          },
          error: (e) => {
            console.error(e);
            if (e.status === 401) {
              this.router.navigate(['/']);
            }
          },
        });
      },
      error: (e) => {
        console.error(e);
        this.router.navigate(['/Administrador']);
      },
    });
  }

  validForm(): boolean {
    let isValid: boolean = true;
    if (this.nombreInput.hasError('maxlength')) {
      isValid = false;
    }

    if (this.descripcionInput.hasError('maxlength')) {
      isValid = false;
    }

    if (!isValid) {
      this.constantsService.loading(false);
      window.scroll({
        top: 0,
        left: 0,
        behavior: 'smooth',
      });
    }
    return isValid;
  }

  setFecha(fecha: string): string {
    let date = new Date(fecha);
    let pipe = new DatePipe('en-US');
    return pipe.transform(date, 'yyyy-MM-dd HH:mm:ss')!;
  }

  selectTiempoXpregunta(event: Event) {
    const selectedValue = (event.target as HTMLSelectElement).value;
    this.nuevaSala.tiempoXpregunta = Number(selectedValue);
  }

  indexTiemXpreg(): number {
    if (this.nuevaSala.tiempoXpregunta) {
      let n = this.tiemposXPregunta.indexOf(this.nuevaSala.tiempoXpregunta);
      return n;
    }
    return 0;
  }
}
