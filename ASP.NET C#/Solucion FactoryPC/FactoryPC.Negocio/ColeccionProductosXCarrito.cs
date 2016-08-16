using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class ColeccionProductosXCarrito
    {

        public ColeccionProductosXCarrito()
        {

        }
        private List<ProductosXCarrito> GenerarListado(List<FactoryPC.DALC.ProductosXCarrito> entidadProductosXCarrito)
        {
            try
            {
                List<ProductosXCarrito> ProductosXCarritos = new List<ProductosXCarrito>();
                foreach (FactoryPC.DALC.ProductosXCarrito prodXcarr in entidadProductosXCarrito)
                {
                    ProductosXCarrito ProductosXCarrito = new ProductosXCarrito();
                    ProductosXCarrito.codProducto = prodXcarr.codProducto;
                    ProductosXCarrito.codCarrito = prodXcarr.codCarrito;
                    ProductosXCarrito.codLista = prodXcarr.codLista;
                    ProductosXCarrito.cantidad = prodXcarr.cantidad;
                    ProductosXCarritos.Add(ProductosXCarrito);
                }
                return ProductosXCarritos;
            }
            catch (Exception err)
            {
                throw err;
            }

        }

        public bool isInTheList(int _codProd, int _codCarrito)
        {
            var ProductosXCarritos = AccesoModelo.modeloFP.ProductosXCarrito.Where(prodXCarr => prodXCarr.codCarrito == _codCarrito && prodXCarr.codProducto == _codProd);
            if (ProductosXCarritos.Count() > 0)
            {
                return true;
            }

            return false;
        }

        public List<ProductosXCarrito> ListarPorCodCarrito(int CodCarrito)
        {

            try
            {
                var ProductosXCarritos = AccesoModelo.modeloFP.ProductosXCarrito.Where(prodXCarr => prodXCarr.codCarrito == CodCarrito);
                return GenerarListado(ProductosXCarritos.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }


        public List<Producto> GenerarListadoCompletoPorCarrito(int CodCarrito)
        {

            try
            {

                List<Producto> productos = new List<Producto>();               

                foreach (var pXc in ListarPorCodCarrito(CodCarrito))
                {
                    Producto p = new Producto();   //Quien Necesita Lambda xD
                    p.ReadByCod(pXc.codProducto);  
                    p.cantidad = pXc.cantidad;
                    p.total = pXc.cantidad * p.precio;
                    productos.Add(p);
                }

                return productos;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductosXCarrito> ListarTodos()
        {
            try
            {
                var ProductosXCarrito = AccesoModelo.modeloFP.ProductosXCarrito;
                return GenerarListado(ProductosXCarrito.ToList());
            }
            catch (Exception err)
            {
                throw err;
            }
        }

        public void LimparLista(int _codCarrito) {
            foreach (var l in ListarPorCodCarrito(_codCarrito))
            {
                l.Delete();
            }
        
        }

    }


}
