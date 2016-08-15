using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TecnoBencina.Negocio;

namespace TecnoBencina.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                System.Console.WriteLine("Solo soy un texto para ser utilizado como un punto de quiebre :3");
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.Message);
            }
            System.Console.ReadKey();
        }
    }
}
