using WebApiRest.Models;

namespace WebApiRest.Utilities
{
    // Este es para validar con las expresiones Regulares
    public static class VF 
    {
        private static bool validForm = true;        

        //Crear Usuario
        public static Response ValidarUsuario(Usuario usuario)
        {
            Response result = new();
            if (!RE.ValidRE(usuario.Nombre, "palabras"))
            {
                result.Error = 1;
                result.Info = WC.GetErrorNombre();
                validForm = false;
            }
            if (!RE.ValidRE(usuario.Correo, "email"))
            {
                result.Error = 1;
                result.Info = WC.GetErrorCorreo();
                validForm = false;
            }
            if (!RE.ValidRE(usuario.Contrasena, "clave"))
            {
                result.Error = 1;
                result.Info = WC.GetErrorClave();
                validForm = false;
            }
            if (!RE.ValidRE(usuario.Contrasena, "invalid"))
            {
                result.Error = 1;
                result.Info = "la contraseña tiene " + WC.GetInvalid();
                validForm = false;
            }

            if (validForm)
            {
                result.Error = 0;
                result.Info = WC.GetSatisfactorio();
            }

            return result;
        } 
    }
}
