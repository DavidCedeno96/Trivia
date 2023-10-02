import { Component, EventEmitter, OnInit, Output, ViewChild,ElementRef } from '@angular/core';
import { Usuario } from 'src/app/model/UsuarioModel';
import { UsuarioService } from 'src/app/services/usuario.service';

import { MessageService } from 'primeng/api';
import { ToastModule } from 'primeng/toast';





@Component({
  selector: 'app-ventana-registro',
  templateUrl: './ventana-registro.component.html',
  styleUrls: ['./ventana-registro.component.css']
  
})
export class VentanaRegistroComponent implements OnInit{

  bool: boolean = false;

  //Inputs
  //mailUsuario: string = "";
 // passwordUsuario: string = "";
  //nombreUsuario: string = "";
  nuevoUsuario: Usuario = {idUsuario: 0, nombre: "",
    correo: "",
    contrasena: "",
    idRol: 2   };
  //respuesta: Result = {info:"", error:0};
  //PARA EL MENSAJE DE ERROR
  errorEncontrado: string = "";
  existeError: boolean = false;

  //MOSTRAR EL MODAL
  formModal: any;
  mostrarModal: boolean = false;

  visible: boolean = false;
      position: string = 'center';

    showDialog(position: string) {
        this.position = position;
        this.visible = true;
    }

 /*  constructor(private usuarioServicio:UsuarioService, private messageService: MessageService) {  
  }  */
  constructor(private usuarioServicio:UsuarioService) {  
  } 

 /*  showToast1() {
    this.messageService.clear();
    this.messageService.add({ key: 'toast1', severity: 'success', summary: 'Registro Exitoso', detail: 'Has realizado tu registro de usuario con éxito' });
} */

  ngOnInit(): void {
       
  }

  @Output() isLoginH = new EventEmitter<boolean>();

  onSubmit() {
    // Aquí puedes acceder a los valores de nombre de usuario y contraseña
    /* console.log('Nombre de usuario:', this.mailUsuario);
    console.log('Contraseña:', this.passwordUsuario);
    console.log('nombre Usuario:', this.nombreUsuario); */
    //console.log(this.nuevoUsuario);
    //Del servicio aplicamos la función crear usuario
    this.usuarioServicio.crearUsuario(this.nuevoUsuario).subscribe({
      next:(data:any)=>{
        const {info, error} = data.result;
        //this.respuesta = data.result;
        console.log(info, error);

        if(error > 0){
          // hay error
          this.errorEncontrado=info;
          this.existeError=true;
        }else{
          // no hay error
          /* this.openFormModal(); */
          //this.showDialog();
          this.isLoginH.emit(true);

        }
      },error:(e)=>{
        console.log(e);        
      }
    });
  }
  

  // Método para cambiar el valor del booleano y emitir el evento
  onClickCambiar() {
    this.isLoginH.emit(true); // Puedes emitir 'true' o 'false' según tu lógica
  }



  openFormModal() {
    this.formModal.show();
  }




  //FUNCIONES PARA CONTROLAR EL MODAL


  

}