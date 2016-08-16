using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class ColeccionCarrito
    {
        private List<Carrito> _carritos;

        public List<Carrito> carritos
        {
            get { return _carritos; }
            set { _carritos = value; }
        }


        public ColeccionCarrito()
        {

        }


        private List<Carrito> GenerarListado(List<FactoryPC.DALC.Carrito> entidadCarrito)
        {
            try
            {
                List<Carrito> carritos = new List<Carrito>();
                foreach (FactoryPC.DALC.Carrito carr in entidadCarrito)
                {
                    Carrito carrito = new Carrito();
                    carrito.codigoCarrito = carr.codCarrito;
                    ColeccionProductosXCarrito ColeccionProductosXCarritos = new ColeccionProductosXCarrito();
                    List<ProductosXCarrito> pXc = new List<ProductosXCarrito>();
                    List<ProductosXCarrito> pXcRecuperada = ColeccionProductosXCarritos.ListarPorCodCarrito(carr.codCarrito);
                    foreach (var pXcLs in pXcRecuperada)
                    {
                        ProductosXCarrito p = new ProductosXCarrito();                       
                        p.ReadByCodLst(pXcLs.codLista);
                        pXc.Add(p);
                    }

                    carrito.listaProductosXCarritos = pXc;
                    carritos.Add(carrito);

                }
                return carritos;
            }       
                

            catch (Exception err)
            {

                throw err;
            }

        }

        public List<Carrito> ListarTodos()
        {
            try
            {
                var carritos = AccesoModelo.modeloFP.Carrito;
                return GenerarListado(carritos.ToList());
            }
            catch (Exception err)
            {
                throw err;
            }
        }

    }
}
