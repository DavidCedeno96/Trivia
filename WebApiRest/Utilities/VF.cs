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
                result.Info = "En el nombre "+ WC.GetErrorLetras();
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
        
        public static Response ValidarSala(Sala sala)
        {
            Response result = new();
            if (!RE.ValidRE(sala.Nombre, "palabras_numeros"))
            {
                result.Error = 1;
                result.Info = "En el nombre " + WC.GetErrorLetrasNumeros();
            }
            if (!RE.ValidRE(sala.Imagen, "invalid"))
            {
                result.Error = 1;
                result.Info = "La imagen tiene " + WC.GetInvalid();
            }
            if (!RE.ValidRE(sala.Descripcion, "invalid"))
            {
                result.Error = 1;
                result.Info = "La descripción tiene " + WC.GetInvalid();
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
