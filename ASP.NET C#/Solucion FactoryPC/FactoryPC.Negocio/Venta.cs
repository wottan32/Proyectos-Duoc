using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class Venta
    {

        public int codVenta { get; set; }
        public Usuario usuario { get; set; }
        public DateTime fechaVenta { get; set; } 
        public Carrito carrito { get; set; }
        public long total { get; set; }

        public Venta()
        {           
        }


        public bool ReadByCod(int cod)
        {
            try
            {
                FactoryPC.DALC.Venta venta = AccesoModelo.modeloFP.Venta.First(vent => vent.codVenta == cod);
                this.codVenta = venta.codVenta;
                Usuario u = new Usuario();
                u.ReadByRut(venta.rutUsuario);
                this.usuario = u;
                this.fechaVenta = venta.fechaVenta;
                Carrito c = new Carrito();
                c.ReadByCod(venta.codCarrito);
                this.carrito = c;
                this.total = venta.total;
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
                FactoryPC.DALC.Venta venta = new DALC.Venta();
                venta.codVenta = this.codVenta;
                venta.rutUsuario = this.usuario.rut;
                venta.fechaVenta = DateTime.Now;
                venta.codCarrito = this.carrito.codigoCarrito;

                ColeccionProductosXCarrito PxCs = new ColeccionProductosXCarrito();
                List<Producto> productos = PxCs.GenerarListadoCompletoPorCarrito(this.carrito.codigoCarrito);
                long queryTotal = 0;
                if (productos.Count()!=0)
                {
                    queryTotal = (from p in productos

                                       select p.total).Sum(); 
                }

                venta.total = queryTotal;

                AccesoModelo.modeloFP.AddToVenta(venta);
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
                FactoryPC.DALC.Venta venta = AccesoModelo.modeloFP.Venta.First(vent => vent.codVenta == codVenta);
                venta.codVenta = this.codVenta;
                venta.rutUsuario = this.usuario.rut;
                venta.fechaVenta = DateTime.Now;
                venta.codCarrito = this.carrito.codigoCarrito;
                ColeccionProductosXCarrito PxCs = new ColeccionProductosXCarrito();
                List<Producto> productos = PxCs.GenerarListadoCompletoPorCarrito(this.carrito.codigoCarrito);
                long queryTotal = 0;
                if (productos.Count() != 0)
                {
                    queryTotal = (from p in productos

                                  select p.total).Sum();
                }

                venta.total = queryTotal;

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
                FactoryPC.DALC.Venta venta = AccesoModelo.modeloFP.Venta.First(vent => vent.codVenta == this.codVenta);
                Carrito carrito = this.carrito;
                carrito.Delete();
                AccesoModelo.modeloFP.DeleteObject(venta);
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
       
  
    }
}
