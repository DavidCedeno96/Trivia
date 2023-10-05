export interface Sala {
  idSala: number;
  nombre: string;
  imagen: string;
  descripcion: string;
  idModoJuego: number;
  modoJuego: string;
  estado: number;
  fecha_creacion: string;
  fecha_modificacion: string;
}

export interface Pregunta {
  idPregunta: number;
  nombre: string;
  estado: number;
}

export interface Opcion {
  idOpcion: number;
  correcta: number; //0 para falso; 1 verdadero
  nombre: string;
  estado: number;
}
