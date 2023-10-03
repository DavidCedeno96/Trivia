import { Component } from '@angular/core';
import { MessageService } from 'primeng/api';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
  
})
export class IniciarSesionComponent {
  isLogin: boolean = true;
  cambiarBoolLogin(nuevoValor: boolean) {
    this.isLogin = nuevoValor;
  }

 /*  constructor(private messageService: MessageService){

  } */

/*   show() {
    this.messageService.add({ severity: 'success', summary: 'Success', detail: 'Message Content' });
} */

}
