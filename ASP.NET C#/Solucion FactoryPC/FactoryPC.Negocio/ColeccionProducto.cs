using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class ColeccionProducto
    {
        public ColeccionProducto()
        {     
        }

        private List<Producto> GenerarListado(List<FactoryPC.DALC.Producto> entidadProducto)
        {
            try
            {
                List<Producto> productos = new List<Producto>();
                foreach (FactoryPC.DALC.Producto prod in entidadProducto)
                {
                    Producto producto = new Producto();
                    producto.codProducto = prod.codProducto;
                    producto.nombre = prod.nombre;
                    producto.precio = prod.precio;
                    productos.Add(producto);
                }
                return productos;
            }
            catch (Exception err)
            {
                throw err;
            }

        }

        public List<Producto> ListarPorCodProd(int _CodProducto)
        {

            try
            {
                var producto = AccesoModelo.modeloFP.Producto.Where(prod => prod.codProducto == _CodProducto);
                return GenerarListado(producto.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Producto> ListarTodos()
        {
            try
            {
                var productos = AccesoModelo.modeloFP.Producto;
                return GenerarListado(productos.ToList());
            }
            catch (Exception err)
            {
                throw err;
            }
        }

    }
}
