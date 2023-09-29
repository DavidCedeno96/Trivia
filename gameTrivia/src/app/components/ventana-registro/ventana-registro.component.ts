import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Usuario } from 'src/app/model/UsuarioModel';
import { UsuarioService } from 'src/app/services/usuario.service';


@Component({
  selector: 'app-ventana-registro',
  templateUrl: './ventana-registro.component.html',
  styleUrls: ['./ventana-registro.component.css']
})
export class VentanaRegistroComponent implements OnInit{

  //Inputs
  mailUsuario: string = "";
  passwordUsuario: string = "";
  nombreUsuario: string = "";
  nuevoUsuario: Usuario = {idUsuario: 0, nombre: "",
    correo: "",
    constrasena: "",
    idRol: 2   };

  constructor(private usuarioServicio:UsuarioService) {

  } 

  ngOnInit(): void {
    
  }

  @Output() isLoginH = new EventEmitter<boolean>();

  onSubmit() {
    // Aquí puedes acceder a los valores de nombre de usuario y contraseña
    console.log('Nombre de usuario:', this.mailUsuario);
    console.log('Contraseña:', this.passwordUsuario);
    console.log('nombre Usuario:', this.nombreUsuario);
    console.log(this.nuevoUsuario);
    
    this.usuarioServicio.crearUsuario(this.nuevoUsuario).subscribe({
      next:(data)=>{
        console.log(data);
      },error:(e)=>{
        console.log(e);
      }
    });
  }

  guardarUsuario(){

  }

  // Método para cambiar el valor del booleano y emitir el evento
  onClickCambiar() {
    this.isLoginH.emit(true); // Puedes emitir 'true' o 'false' según tu lógica
  }

}
