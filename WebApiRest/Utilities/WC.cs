namespace WebApiRest.Utilities
{
    public static class WC
    {

        private static readonly string satisfactorio = "Ok";
        private static readonly string errorArchivo = "Tipo de archivo no permitido";
        private static readonly string archivoExistente = "El archivo ya existe";
        private static readonly string errorLetrasNumeros = "solo se permiten letras y números";
        private static readonly string errorLetras = "solo se permiten letras";
        private static readonly string errorCorreo = "Ingrese un correo válido";
        private static readonly string errorClave = "La contraseña debe tener al menos 5 caracteres de longitud, contener al menos un número, contener al menos una letra mayúscula, contener al menos una letra minúscula o solo los siguientes caracteres #@_-.";
        private static readonly string invalid = "cacarteres invalidos";

        public static string GetRutaImagen(IWebHostEnvironment env, string nombreImagen, string nombreCarpeta)
        {
            string rutaPrincipal = Path.Combine(env.ContentRootPath, "Content", "Images", nombreCarpeta);
            return Path.Combine(rutaPrincipal, nombreImagen);
        }

        public static string GetTrim(string cadena)
        {
            if (cadena != null)
            {
                return cadena.Trim();
            }
            return "";
        }
        
        public static bool GetArchivoPermitido(string tipos, string nombreArchivo)
        {
            string extension = Path.GetExtension(nombreArchivo);
            List<string> tiposList = tipos.Split("/").ToList();
            foreach (string tipo in tiposList)
            {
                if (extension.Contains(tipo))
                {
                    return true;
                }
            }   
            
            return false;
        }

        public static string GetContentType(string nombreArchivo)
        {
            var extension = Path.GetExtension(nombreArchivo);
            string contentType;
            switch (extension.ToLower())
            {
                case ".jpg":
                case ".jpeg":
                    {
                        contentType = "image/jpeg";
                        break;
                    }                    
                case ".png":
                    {
                        contentType = "image/png";
                        break;
                    }                    
                case ".gif":
                    {
                        contentType = "image/gif";
                        break;
                    }                    
                default:
                    {
                        contentType = "application/octet-stream"; // Tipo MIME genérico si el formato no se reconoce.
                        break;
                    }                    
            }
            return contentType;
        }

        public static string GetSatisfactorio()
        {
            return satisfactorio;
        }
        public static string GetErrorArchivo()
        {
            return errorArchivo;
        }
        public static string GetArchivoExistente()
        {
            return archivoExistente;
        }
        public static string GetErrorLetrasNumeros()
        {
            return errorLetrasNumeros;
        }
        public static string GetErrorLetras()
        {
            return errorLetras;
        }
        public static string GetErrorCorreo()
        {
            return errorCorreo;
        }
        public static string GetErrorClave()
        {
            return errorClave;
        }
        public static string GetInvalid()
        {
            return invalid;
        }
    }
}
