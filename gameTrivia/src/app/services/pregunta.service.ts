import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UsuarioService } from './usuario.service';
import { environment } from 'src/environments/environments';
import { Pregunta, Pregunta_OpcionList } from '../model/SalaModel';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class PreguntaService {
  private apiURL: string = environment.URL + '/api/pregunta';

  constructor(
    private http: HttpClient,
    private usuarioServicio: UsuarioService
  ) {}

  listaPreguntaByIdSala(
    estados: number,
    idSala: number
  ): Observable<Pregunta[]> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    return this.http.get<Pregunta[]>(
      `${this.apiURL}/list/${estados}/${idSala}`,
      {
        headers: headers,
      }
    );
  }

  crearPreguntaOpciones(
    pregunta_opcionList: Pregunta_OpcionList
  ): Observable<Pregunta_OpcionList> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    const body = JSON.stringify(pregunta_opcionList);
    return this.http.post<Pregunta_OpcionList>(`${this.apiURL}/create`, body, {
      headers: headers,
    });
  }
}
