using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class ColeccionVenta
    {

  

        public ColeccionVenta()
        {
         
        }


        private List<Venta> GenerarListado(List<FactoryPC.DALC.Venta> entidadVenta)
        {
            try
            {
                List<Venta> ventas = new List<Venta>();
                foreach (FactoryPC.DALC.Venta vent in entidadVenta)
                {
                    Venta venta = new Venta();
                    venta.codVenta = vent.codVenta;
                    Usuario u = new Usuario();
                    u.ReadByRut(vent.rutUsuario);
                    venta.usuario = u;
                    venta.fechaVenta = vent.fechaVenta;
                    Carrito c = new Carrito();                    
                    c.ReadByCod(vent.codCarrito);
                    Carrito f = new Carrito();
                    venta.carrito = c;
                    venta.total = vent.total;
                    ventas.Add(venta);
                }
                return ventas;
            }
            catch (Exception err)
            {
                throw err;
            }

        }

        public List<Venta> ListarTodos()
        {
            try
            {
                var ventas = AccesoModelo.modeloFP.Venta;
                return GenerarListado(ventas.ToList());
            }
            catch (Exception err)
            {
                throw err;
            }
        }
    }
    
}
