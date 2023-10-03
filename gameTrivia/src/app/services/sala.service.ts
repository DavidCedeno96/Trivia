import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environments';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { Sala } from '../model/SalaModel';
import { UsuarioService } from 'src/app/services/usuario.service';

@Injectable({
  providedIn: 'root',
})
export class SalaService {
  private apiURL: string = environment.URL + '/sala'; //Para crear el usuario

  constructor(
    private http: HttpClient,
    private usuarioServicio: UsuarioService
  ) {}

  crearUsuario(formData: FormData): Observable<FormData> {
    const headers = new HttpHeaders({
      Authorization: 'Bearer ' + this.usuarioServicio.getToken(),
    });
    return this.http.post<FormData>(`${this.apiURL}/create`, formData, {
      headers: headers,
    });
  }
}
