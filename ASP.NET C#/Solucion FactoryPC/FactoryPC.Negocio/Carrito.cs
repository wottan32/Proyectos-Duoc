using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class Carrito
    {
        public int codigoCarrito { get; set; }
       
        public List<ProductosXCarrito> listaProductosXCarritos {get; set;}

        
        public Carrito()
        {
            listaProductosXCarritos = new List<ProductosXCarrito>();

        }


        public bool ReadByCod(int _codCarrito)
        {
            try
            {
                FactoryPC.DALC.Carrito carrito = AccesoModelo.modeloFP.Carrito.First(carr => carr.codCarrito == _codCarrito);
                this.codigoCarrito = carrito.codCarrito;
                ColeccionProductosXCarrito PxC = new ColeccionProductosXCarrito();    
                this.listaProductosXCarritos = PxC.ListarPorCodCarrito(this.codigoCarrito);
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
                FactoryPC.DALC.Carrito carrito = new DALC.Carrito();
                carrito.codCarrito = this.codigoCarrito;
                foreach (var pXc in listaProductosXCarritos)
                {                  
                    ProductosXCarrito pxc = new ProductosXCarrito();
                    pxc.codCarrito = this.codigoCarrito;
                    pxc.codProducto = pXc.codProducto;
                    pxc.cantidad = pXc.cantidad;      
                    FactoryPC.Negocio.ColeccionProductosXCarrito ProductosXCarritos = new FactoryPC.Negocio.ColeccionProductosXCarrito();
                    List<ProductosXCarrito> lstRecuperada = ProductosXCarritos.ListarTodos();
                    if (lstRecuperada.Count > 0)
                    {
                        int maxCodLista = lstRecuperada.Max(prodXCarr => prodXCarr.codLista);//podria haber realizado una funcion de auto-increment en la DB
                        pxc.codLista = (maxCodLista + 1);
                    }
                    else
                    {
                        pxc.codLista = 0;
                    }
                    pxc.Create();
                }

                AccesoModelo.modeloFP.AddToCarrito(carrito);
                AccesoModelo.modeloFP.SaveChanges();
                return true;
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
                FactoryPC.DALC.Carrito carrito = AccesoModelo.modeloFP.Carrito.First(carr => carr.codCarrito == codigoCarrito);
                carrito.codCarrito = this.codigoCarrito;

                ColeccionProductosXCarrito collPxC= new ColeccionProductosXCarrito();
                List<ProductosXCarrito> PxCs = collPxC.ListarPorCodCarrito(this.codigoCarrito);
                foreach (var PxC in PxCs)
                {
                    PxC.Update();
                }        

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
                FactoryPC.DALC.Carrito carrito = AccesoModelo.modeloFP.Carrito.First(carr => carr.codCarrito == this.codigoCarrito);
                ColeccionProductosXCarrito PxCs = new ColeccionProductosXCarrito();
                PxCs.LimparLista(this.codigoCarrito);
                AccesoModelo.modeloFP.DeleteObject(carrito);
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
