using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class ProductosXCarrito
    {
        private int _codLista;
        public int codLista
        {
            get { return _codLista; }
            set
            {
                if (value>=0)
                {
                    _codLista = value;
                }
                else
                {
                    throw new ArgumentException("El código de la lista debe ser igual o mayor que cero");
                }
            }
        }
        private int _codCarrito;
        public int codCarrito
        {
            get { return _codCarrito; }
            set
            {
                if (value>=0)
                {
                    _codCarrito = value; 
                }
                else
                {
                    throw new ArgumentException("El código del carrito debe ser igual o mayor que cero");
                }
            }
        }
        private int _codProducto;
        public int codProducto
        {
            get { return _codProducto; }
            set
            {
                if (value>=0)
                {
                    _codProducto = value;
                }
                else
                {
                    throw new ArgumentException("El código del producto debe ser igual o mayor que cero");
                }
            }
        }
        private int _cantidad;

        public int cantidad
        {
            get { return _cantidad; }
            set
            {
                if (value>0)
                {
                    _cantidad = value;
                }
                else
                {
                    throw new ArgumentException("La cantidad debe der mayor a 0");
                }
            }
        }

        public ProductosXCarrito()
        {

        }

        public bool ReadByCodLst(int codLista)
        {
            try
            {
                FactoryPC.DALC.ProductosXCarrito productosXcarrito = AccesoModelo.modeloFP.ProductosXCarrito.First(codLst => codLst.codLista == codLista);
                this.codLista = productosXcarrito.codLista;
                this.codCarrito = productosXcarrito.codCarrito;
                this.codProducto = productosXcarrito.codProducto;
                this.cantidad = productosXcarrito.cantidad;

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Create()
        {
            try
            {

                ColeccionProductosXCarrito ColeccionProductosXCarritos = new ColeccionProductosXCarrito();

                //si ya existe un producto en la coleccion asociado a este carrito, solo incremento la cantidad
                if (!ColeccionProductosXCarritos.isInTheList(this.codProducto, this.codCarrito))
                {
                    FactoryPC.DALC.ProductosXCarrito productosXcarrito = new DALC.ProductosXCarrito();
                    //productosXcarrito.codLista = this.codLista;



               
                    FactoryPC.Negocio.ColeccionProductosXCarrito ProductosXCarritos = new FactoryPC.Negocio.ColeccionProductosXCarrito();
                    List<ProductosXCarrito> lstRecuperada = ProductosXCarritos.ListarTodos();
                    if (lstRecuperada.Count > 0)
                    {
                        int maxCodLista = lstRecuperada.Max(prodXCarr => prodXCarr.codLista);//podria haber realizado una funcion de auto-increment en la DB
                        productosXcarrito.codLista = (maxCodLista + 1);
                    }
                    else
                    {
                        productosXcarrito.codLista = 0;
                    }


                    productosXcarrito.codProducto = this.codProducto;
                    productosXcarrito.codCarrito = this.codCarrito;
                    productosXcarrito.cantidad = this.cantidad;
                    AccesoModelo.modeloFP.AddToProductosXCarrito(productosXcarrito);
                    AccesoModelo.modeloFP.SaveChanges();
                    return true;
                }
                else
                {
                    FactoryPC.DALC.ProductosXCarrito productosXcarrito = AccesoModelo.modeloFP.ProductosXCarrito.First(codLst => codLst.codLista == codLista);
                    productosXcarrito.codProducto = this.codProducto;
                    productosXcarrito.codLista = this.codLista;
                    productosXcarrito.codCarrito = this.codCarrito;
                    productosXcarrito.cantidad += this.cantidad;
                    AccesoModelo.modeloFP.SaveChanges();
                    return true;
                }               
            }
            catch (Exception ex)
            {
                return false;
            }


        }


        public bool Update()
        {
            try
            {
                FactoryPC.DALC.ProductosXCarrito productosXcarrito = AccesoModelo.modeloFP.ProductosXCarrito.First(codLst => codLst.codLista == codLista);
                productosXcarrito.codProducto = this.codProducto;
                productosXcarrito.codLista = this.codLista;
                productosXcarrito.codCarrito = this.codCarrito;
                productosXcarrito.cantidad = this.cantidad;
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete()
        {
            try
            {
                FactoryPC.DALC.ProductosXCarrito productosXcarrito = AccesoModelo.modeloFP.ProductosXCarrito.First(codLst => codLst.codLista == this.codLista);
                AccesoModelo.modeloFP.DeleteObject(productosXcarrito);
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


    }
}
