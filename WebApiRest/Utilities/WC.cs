namespace WebApiRest.Utilities
{
    public static class WC
    {

        private static readonly string satisfactorio = "Ok";
        private static readonly string errorNombre = "Ingrese un nombre válido, no se permiten números o caracteres especiales";
        private static readonly string errorCorreo = "Ingrese un correo válido";
        private static readonly string errorClave = "La contraseña debe tener al menos 5 caracteres de longitud, contener al menos un número, contener al menos una letra mayúscula, contener al menos una letra minúscula o solo los siguientes caracteres #@_-.";
        private static readonly string invalid = "cacarteres invalidos <>";

        public static string GetRutaImagen(IWebHostEnvironment env, string nombreImagen, string nombreCarpeta)
        {
            string rutaPrincipal = Path.Combine(env.ContentRootPath, "Content", "Img", nombreCarpeta);
            return Path.Combine(rutaPrincipal, nombreImagen);
        }

        public static string GetTrim(string cadena)
        {
            if (string.IsNullOrEmpty(cadena))
            {
                return null;
            }
            else
            {
                return cadena.Trim();
            }
        }

        public static string GetSatisfactorio()
        {
            return satisfactorio;
        }

        public static string GetErrorNombre()
        {
            return errorNombre;
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
