import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environments';
import { Observable } from 'rxjs';
import { Usuario } from '../model/UsuarioModel';

@Injectable({
  providedIn: 'root'

})
export class UsuarioService {
  
  private apiURL: string  = environment.URL; //API DE LA URL
  private endPoint: string = this.apiURL+'/usuario'; //Para crear el usuario

  constructor(private http:HttpClient) { 
  }

  crearUsuario(modelo: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(`${this.endPoint}/Create`,modelo);
  }

}
