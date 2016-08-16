using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FactoryPC.Negocio;

namespace FactoryPC.Web.carrito
{
    public partial class MantenedorCarrito : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            dataBindCarritos();
        }

        protected void bntContinuar_Click(object sender, EventArgs e)
        {
            try
            {
                Carrito carrito = new Carrito();


                if (carrito.ReadByCod(int.Parse(txtCodCarrito.Text)))
                {
                    dataBindProductos();
                }
                else
                {
                    Carrito c = new Carrito();
                    c.codigoCarrito = int.Parse(txtCodCarrito.Text);
                    c.Create();
                    dataBindCarritos();
                }

                pnlAgregarObjetos.Visible = true;
                pnlNombreInstancia.Visible = false;
            }
            catch (FormatException) { lblMessage.Text = "Ingrese datos numericos"; }
            catch (Exception ex) { lblMessage.Text = ex.Message; }
        }

        protected void btnEliminarCarrito_Click(object sender, EventArgs e)
        {
            Carrito c = new Carrito();
            c.codigoCarrito = int.Parse(txtCodCarrito.Text);
            c.Delete();
            dataBindCarritos();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            try
            {
                ProductosXCarrito PxC = new ProductosXCarrito();


                ColeccionProductosXCarrito PxCs = new ColeccionProductosXCarrito();
                List<ProductosXCarrito> productos = PxCs.ListarPorCodCarrito(int.Parse(txtCodCarrito.Text));
                if (productos.Count>0)
                {
                    foreach (var p in productos)
                    {
                        if (p.codProducto == int.Parse(TxtCodProducto.Text))
                        {

                            p.cantidad += int.Parse(txtCantidad.Text);
                            p.Update();

                            dataBindProductos();
                        }
                        else
                        {
                            PxC.cantidad = int.Parse(txtCantidad.Text);
                            PxC.codCarrito = int.Parse(txtCodCarrito.Text);
                            PxC.codProducto = int.Parse(TxtCodProducto.Text);
                            PxC.Create();
                        }
                    }
                }
                else
                {
                    
                    Carrito c = new Carrito();
                    c.codigoCarrito = int.Parse(txtCodCarrito.Text);
                    List<ProductosXCarrito> prodsXcar = new List<ProductosXCarrito>();
                    ProductosXCarrito pxc = new ProductosXCarrito();
                    pxc.cantidad = int.Parse(txtCantidad.Text);
                    pxc.codCarrito = c.codigoCarrito;
                    pxc.codProducto = int.Parse(TxtCodProducto.Text);
                    pxc.Create();
                    prodsXcar.Add(pxc);
                    c.listaProductosXCarritos = prodsXcar;
                    c.Update();
                    dataBindProductos();

                }

                

                dataBindProductos();
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
   

            ColeccionProductosXCarrito PxCs = new ColeccionProductosXCarrito();
            List<ProductosXCarrito> productos = PxCs.ListarPorCodCarrito(int.Parse(txtCodCarrito.Text));
            foreach (var p in productos)
            {
                if (p.codProducto==int.Parse(TxtCodProducto.Text))
                {
                    if (int.Parse(txtCantidad.Text)>=p.cantidad)
                    {
                        p.Delete();
                    }
                    else
                    {
                        p.cantidad -=int.Parse(txtCantidad.Text);
                        p.Update();
                    }
                    
                    dataBindProductos();
                }
            }


        }

        private void dataBindProductos()
        {
            ColeccionProductosXCarrito PxCs = new ColeccionProductosXCarrito();
            List<Producto> PxC = PxCs.GenerarListadoCompletoPorCarrito(int.Parse(txtCodCarrito.Text));
            if (PxC.Count() >0)
            {
                gvListaProductosCarrito.DataSource = PxC;
                gvListaProductosCarrito.DataBind();
                lblListarAgregados.Text = "";
            }
            else
            {
                lblListarAgregados.Text = "No hay elementos para mostrar";
            }
        }

        private void dataBindCarritos()
        {
            ColeccionCarrito carritos = new ColeccionCarrito();
            List<Carrito> carr = carritos.ListarTodos();
            if (carr.Count() > 0)
            {
                gvCarritos.DataSource = carr;
                gvCarritos.DataBind();
                lblListar.Text = "";
            }
            else
            {
                lblListar.Text = "No hay elementos para mostrar";
            }
        }
        private void limpairLbl()
        {
            lblListar.Text = String.Empty;
            lblListarAgregados.Text = string.Empty;
            lblMessage.Text = String.Empty;

        }

        protected void btnTerminar_Click(object sender, EventArgs e)
        {
            pnlAgregarObjetos.Visible = false;
            pnlNombreInstancia.Visible = true;
            limpiar();
            limpairLbl();
        }

        private void limpiar()
        {
            txtCodCarrito.Text = String.Empty;
            TxtCodProducto.Text = String.Empty;
            txtCantidad.Text = String.Empty;
        }
    }
}