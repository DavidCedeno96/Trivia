import { Component, ViewChild, ElementRef, } from '@angular/core';
import { MessageService } from 'primeng/api';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
  
})
export class IniciarSesionComponent {
  isLogin: boolean = true;
  isVideoEnded: boolean = false;

  @ViewChild('videoHorizontal') videoHorizontal!: ElementRef;
  @ViewChild('videoVertical') videoVertical!: ElementRef;

  playVideo(video: any) {
    if (video) {
      video.play();
    }
  }  

  cambiarBoolLogin(nuevoValor: boolean) {
    this.isLogin = nuevoValor;
  }

  vidEnded(){
    console.log("Entro al video");
    this.isVideoEnded = true;

  }

}
