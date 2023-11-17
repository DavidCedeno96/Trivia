namespace WebApiRest.Utilities
{
    public static class WC
    {
        private static readonly string adminRol = "Administrador";
        private static readonly string superAdminRol = "SuperAdministrador";

        private static readonly string satisfactorio = "Satisfactorio";        
        private static readonly string archivoExistente = "El archivo ya existe";
        private static readonly string errorArchivo = "Tipo de archivo no permitido";        
        private static readonly string errorLetrasNumeros = "Solo se permiten letras y números";
        private static readonly string errorLetras = "Solo se permiten letras";
        private static readonly string errorDpi = "Solo se permiten números y debe tener mínimo 13 y máximo 15 números";
        private static readonly string errorCorreo = "Ingrese un correo válido";
        private static readonly string errorClave = "Debe tener al menos 5 caracteres de longitud, contener al menos un número, contener al menos una letra mayúscula, contener al menos una letra minúscula o solo los siguientes caracteres #@_-.";
        private static readonly string invalid = "Tiene cacarteres invalidos";
        private static readonly string max50 = "Máximo 50 caracteres";

        public static string GetRutaImagen(IWebHostEnvironment env, string nombreImagen, string nombreCarpeta)
        {
            string rutaPrincipal = Path.Combine(env.ContentRootPath, "wwwroot", "Content", "Images", nombreCarpeta);
            return Path.Combine(rutaPrincipal, nombreImagen.Trim());
        }

        public static string GetRutaArchivo(IWebHostEnvironment env, string nombreArchivo, string nombreCarpeta)
        {
            string rutaPrincipal = Path.Combine(env.ContentRootPath, "wwwroot", "Content", "Archivos", nombreCarpeta);
            return Path.Combine(rutaPrincipal, nombreArchivo.Trim());
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
            string extension = Path.GetExtension(nombreArchivo.ToLower());
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

        public static string GetAdminRol()
        {
            return adminRol;
        }
        public static string GetSuperAdminRol()
        {
            return superAdminRol;
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
        public static string GetErrorDpi()
        {
            return errorDpi;
        }
        public static string GetErrorClave()
        {
            return errorClave;
        }
        public static string GetInvalid()
        {
            return invalid;
        }
        public static string GetMax50()
        {
            return max50;
        }
    }
}
