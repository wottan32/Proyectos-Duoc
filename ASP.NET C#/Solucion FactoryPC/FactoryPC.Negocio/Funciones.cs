using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Text.RegularExpressions;


namespace FactoryPC.Negocio
{
    public class Funciones
    {
        /// <summary>
        /// @iformas
        /// Verifica si el email cumple el formato adecuado, no si este realmente existe
        /// https://msdn.microsoft.com/en-us/library/01escwtf%28v=vs.100%29.aspx
        /// </summary>
        /// <param name="strIn"></param>
        /// <returns></returns>
        private bool invalid = false;
        public bool IsValidEmail(string strIn)
        {
            invalid = false;
            if (String.IsNullOrEmpty(strIn))
                return false;

            // Use IdnMapping class to convert Unicode domain names.
            strIn = Regex.Replace(strIn, @"(@)(.+)$", this.DomainMapper);
            if (invalid)
                return false;

            // Return true if strIn is in valid e-mail format.
            return Regex.IsMatch(strIn,
                   @"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                   @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                   RegexOptions.IgnoreCase);
        }

        private string DomainMapper(Match match)
        {
            // IdnMapping class with default property values.
            IdnMapping idn = new IdnMapping();

            string domainName = match.Groups[2].Value;
            try
            {
                domainName = idn.GetAscii(domainName);
            }
            catch (ArgumentException)
            {
                invalid = true;
            }
            return match.Groups[1].Value + domainName;
        }

        /// <summary>
        /// @iformas
        /// Verifica que la contraseña contenga mayusculas, minusculas y números
        /// http://stackoverflow.com/questions/27402126/check-if-string-have-uppercase-lowercase-and-number
        /// </summary>
        /// <param name="strIn"></param>
        /// <returns></returns>
        public bool isValidPass(String strIn)
        {
            bool isUpper = false, isLower = false, isDigit = false;
            for (int i = 0; i < strIn.Length && !(isUpper && isLower && isDigit); i++)
            {
                
                char c = strIn[i];
                isUpper = isUpper || char.IsUpper(c);
                isLower = isLower || char.IsLower(c);
                isDigit = isDigit || char.IsDigit(c);
            }
            bool isValid = isUpper && isLower && isDigit;
            return isValid;
        }

        /// <summary>
        /// @iformas
        /// Verifica que el rut sea valido
        /// http://www.qualityinfosolutions.com/validador-de-rut-chileno-en-c/
        /// </summary>
        /// <param name="rut"></param>
        /// <returns></returns>
        public bool isValidRut(string rut)
        {

            bool validacion = false;
            try
            {
                rut = rut.ToUpper();
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");
                int rutAux = int.Parse(rut.Substring(0, rut.Length - 1));

                char dv = char.Parse(rut.Substring(rut.Length - 1, 1));

                int m = 0, s = 1;
                for (; rutAux != 0; rutAux /= 10)
                {
                    s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
                }
                if (dv == (char)(s != 0 ? s + 47 : 75))
                {
                    validacion = true;
                }
            }
            catch (Exception)
            {
                
                validacion = false;
            }
            return validacion;
        }

    }
}
