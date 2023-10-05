import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environments';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UsuarioService } from 'src/app/services/usuario.service';
import { Sala } from '../model/SalaModel';

@Injectable({
  providedIn: 'root',
})
export class SalaService {
  private apiURL: string = environment.URL + '/api/sala'; //Para crear el usuario
  private apiURLImages: string = environment.URL + '/Content/Images/Sala';

  constructor(
    private http: HttpClient,
    private usuarioServicio: UsuarioService
  ) {}

  getURLImages() {
    return this.apiURLImages;
  }

  listaSala(estados: number): Observable<Sala[]> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    return this.http.get<Sala[]>(`${this.apiURL}/list/${estados}`, {
      headers: headers,
    });
  }

  /* crearUsuario(modelo: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(`${this.apiURL}/Create`, modelo);
  } */

  crearSala(formData: FormData): Observable<FormData> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    headers.append('Access-Control-Allow-Credentials', 'true');
    return this.http.post<FormData>(`${this.apiURL}/create`, formData, {
      headers: headers,
    });
  }
}
