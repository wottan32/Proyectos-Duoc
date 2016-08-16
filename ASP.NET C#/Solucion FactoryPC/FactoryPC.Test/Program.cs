using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FactoryPC.Negocio;



namespace FactoryPC.Test
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                //usuario("7411996-4", "iformas", "Samrofi").Create();
                //producto(10, "PortalGun", 1000000).Create();
                //carrito().Update();

                ColeccionProductosXCarrito col = new ColeccionProductosXCarrito();
                

                foreach (var p in col.GenerarListadoCompletoPorCarrito(0))
                {
                    Console.WriteLine(p);
                }


                Console.ReadKey();
            }
            catch (Exception)
            {
                
                throw;
            }

        }


        private static Carrito carrito() {
            List<Producto> lstProd = new List<Producto>();
            lstProd.Add(producto(10, "PortalGun", 1000000));
            Carrito carr = new Carrito();
            carr.codigoCarrito = 0;
            //carr.listaProductos = lstProd;
            return carr;
        
        }

        private static Usuario usuario(String _rut, String _nombre, String _apellido) {

            Usuario usr = new Usuario();
            usr.rut = _rut;
            usr.nombres = _nombre;
            usr.apellidos = _apellido;
            usr.telefono = "000000";
            usr.email = "i.formas@alumnos.duoc.cl";

            return usr;
        }

        private static Producto producto(int _codProd, String _nombre, long _precio) {
            Producto p = new Producto();
            p.codProducto = _codProd;
            p.nombre = _nombre;
            p.precio = _precio;
            return p;        
        }
    }
}
