namespace WebApiRest.Utilities
{
    public static class WC
    {

        private static readonly string satisfactorio = "ok"; 

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
    }
}
