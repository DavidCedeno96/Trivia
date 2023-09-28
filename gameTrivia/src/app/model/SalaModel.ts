export interface Sala {
    idSala: number;
    nombre: string;
    imagen: string;
    descripcion: string;
    idModoJuego: string;
    estado: number;
  }

export interface Pregunta {
    idPregunta: number;
    nombre: string;
    estado: number;
  
  }

export interface Opcion {
    idOpcion: number;
    correcta:number;//0 para falso; 1 verdadero
    nombre: string;
    estado: number;
  }