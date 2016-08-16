using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class Producto
    {


       
        public int codProducto { get; set; }
        public String nombre { get; set; }
        public long  precio { get; set; }
        public int cantidad { get; set; }
        public long total { get; set; }


        public Producto()
        {
            this.init();
        }

        private void init()
        {
            this.nombre = String.Empty;
            this.codProducto = 0;
            this.precio = 0;
        }

        public Producto(String _nombProducto, int _codProducto, long _precio)
            : this()
        {
            nombre = _nombProducto;
            codProducto = _codProducto;
            precio = _precio;
        }


        public override string ToString()
        {
            return String.Format("Nombre Producto: {0}, Codigo Producto: {1}, Precio Producto: {2}, cantidad: {3}, total: {4}", nombre, codProducto, precio, cantidad, total);
        }


        public bool ReadByCod(int cod)
        {
            try
            {
                FactoryPC.DALC.Producto producto = AccesoModelo.modeloFP.Producto.First(prod => prod.codProducto == cod);
                this.codProducto = producto.codProducto;
                this.nombre = producto.nombre;
                this.precio = producto.precio;
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
                FactoryPC.DALC.Producto producto = new DALC.Producto();
                producto.codProducto = this.codProducto;
                producto.nombre = this.nombre;
                producto.precio = this.precio;

                AccesoModelo.modeloFP.AddToProducto(producto);
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
                FactoryPC.DALC.Producto producto = AccesoModelo.modeloFP.Producto.First(prod => prod.codProducto == codProducto);
                producto.codProducto = this.codProducto;
                producto.nombre = this.nombre;
                producto.precio = this.precio;
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
                FactoryPC.DALC.Producto producto = AccesoModelo.modeloFP.Producto.First(prod => prod.codProducto == this.codProducto);
                AccesoModelo.modeloFP.DeleteObject(producto);
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception ex )
            {                
                return false;   
            }
        }

    }
}
