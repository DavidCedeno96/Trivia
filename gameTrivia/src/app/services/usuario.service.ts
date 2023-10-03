import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environments';
import { Observable } from 'rxjs';
import { Usuario } from '../model/UsuarioModel';
import { LoginUsuario } from '../model/LoginModel';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class UsuarioService {
  private apiURL: string = environment.URL + '/usuario'; //Para crear el usuario

  constructor(private http: HttpClient, private router: Router) {}

  crearUsuario(modelo: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(`${this.apiURL}/Create`, modelo);
  }

  loginUsuario(modelo: LoginUsuario): Observable<LoginUsuario> {
    return this.http.post<LoginUsuario>(`${this.apiURL}/auth`, modelo);
  }

  loggedIn() {
    return !!localStorage.getItem('token');
  }

  logout() {
    localStorage.removeItem('token');
    this.router.navigate(['/Iniciar_Sesion']);
  }

  getToken() {
    return localStorage.getItem('token');
  }
  getRol() {
    return localStorage.getItem('rol');
  }
}
