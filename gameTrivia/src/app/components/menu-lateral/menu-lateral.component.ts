import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ConstantsService } from 'src/app/constants.service';
import { UsuarioSalaService } from 'src/app/services/usuario-sala.service';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-menu-lateral',
  templateUrl: './menu-lateral.component.html',
  styleUrls: ['./menu-lateral.component.css']
})
export class MenuLateralComponent implements OnInit {
  
  idRol = 0;
  result: string = '';
  existeError: boolean = false;


  constructor(
    private usuarioServicio: UsuarioService,
    private usuario_salaServicio: UsuarioSalaService,
    private constantsService: ConstantsService,
    private router: Router,
  ){

  }
  ngOnInit(){
    this.idRol = parseInt(this.usuarioServicio.getRol()!);
  }


  cerrarSesion() {
    this.usuarioServicio.logout();
  }

  descargarReporteSalasUsuarios() {
    this.constantsService.loading(true);
    this.usuario_salaServicio.reporteRanking(0).subscribe({
      next: (data: any) => {
        let { info, error } = data.result;
        this.result = info;
        if (error > 0) {
          this.existeError = true;
        } else {
          this.existeError = false;

          let url = this.usuario_salaServicio.getUrlArchivo(info);

          const element = document.createElement('a');
          element.download = `Ranking.xls`;
          element.href = url;
          element.click();
        }
        this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

}
