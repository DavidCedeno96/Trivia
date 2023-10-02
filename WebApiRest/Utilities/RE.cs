using System.Text.RegularExpressions;

namespace WebApiRest.Utilities
{
    // Esta clase es para Regular Expresions
    public static class RE
    {
        /*
         * La clave debe:
            Tener al menos 5 caracteres de longitud.
            Contener al menos un número.
            Contener al menos una letra mayúscula.
            Contener al menos una letra minúscula.
         */

        private static readonly string palabras = "^[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\\s]+$";
        private static readonly string email = @"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$";
        private static readonly string clave = @"^(?=.*[A-Z]+)(?=.*[a-z]+)(?=.*\d+)[#@_\-\.a-zA-Z\d]{5,}$";
        private static readonly string caracterInvalido = @"^[^<>]+$";

        private static Regex Patron(string patron)
        {
            Regex regex;
            switch (patron.ToLower())
            {
                case "palabras":
                    {
                        regex = new Regex(palabras);
                        break;
                    }
                case "email":
                    {
                        regex = new Regex(email);
                        break;
                    }
                case "clave":
                    {
                        regex = new Regex(clave);
                        break;
                    }
                case "invalid":
                    {
                        regex = new Regex(caracterInvalido);
                        break;
                    }
                default:
                    {
                        regex = new Regex("");
                        break;
                    }
            }

            return regex;
        }

        public static bool ValidRE(string text, string patron) 
        {
            Regex regex = Patron(patron);                   

            if (string.IsNullOrEmpty(text))
            {
                return true;
            }

            Match match = regex.Match(text.Trim());

            return match.Success;
        }        
    }
}
