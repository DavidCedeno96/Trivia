import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class TimeApiService {
  private apiUrl = 'https://worldtimeapi.org/api/timezone/Europe/London'; // URL de la API de WorldTimeAPI

  constructor(private http: HttpClient) {}

  getLondonTime(): Observable<any> {
    return this.http.get(this.apiUrl);
  }

  convertToLondonTime(userDateTime: Date): Observable<string> {
    // Convertir la fecha y hora del usuario a un formato ISO string
    const userISOString = userDateTime.toISOString();
    console.log('FECHA user', userISOString);

    // Realizar una solicitud a la API de WorldTimeAPI para obtener la hora actual en Londres
    return this.http.get<any>(this.apiUrl).pipe(
      map((data: any) => {
        // Obtener el offset de la zona horaria actual de Londres
        const londonOffsetString = data.utc_offset;

        // Extraer las horas y minutos del offset
        const offsetParts = londonOffsetString.split(':');
        const offsetHours = parseInt(offsetParts[0]);
        const offsetMinutes = parseInt(offsetParts[1]);

        // Crear un objeto Date con la fecha y hora proporcionada por el usuario
        const userDateTime = new Date(userISOString);

        // Ajustar la fecha y hora sumando el offset de Londres en horas y minutos
        userDateTime.setHours(userDateTime.getHours() + offsetHours);
        userDateTime.setMinutes(userDateTime.getMinutes() + offsetMinutes);

        // Formatear la fecha y hora en Londres en un formato legible
        const formattedDate = userDateTime.toLocaleDateString();
        const formattedTime = userDateTime.toLocaleTimeString();

        // Devolver la fecha y hora formateadas como una cadena
        return `${formattedDate} ${formattedTime}`;
      })
    );
  }
}
