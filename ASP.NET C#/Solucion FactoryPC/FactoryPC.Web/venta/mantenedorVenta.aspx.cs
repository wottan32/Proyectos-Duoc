using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FactoryPC.Negocio;

namespace FactoryPC.Web.venta
{
    public partial class mantenedorVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dataBindVentas();
        }

        protected void bntAgregar_Click(object sender, EventArgs e)
        {

            try
            {
                Venta v = new Venta();
                Carrito c = new Carrito();
                Usuario u = new Usuario();

                if (c.ReadByCod(int.Parse(txtCodCarrito.Text)) && u.ReadByRut(txtRutUsuario.Text))
                {
                    v.codVenta = int.Parse(txtCodVenta.Text);
                    v.carrito = c;
                    v.usuario = u;
                    v.Create();
                    limpiar();
                    dataBindVentas();
                }
                else
                {
                    throw new ArgumentException("El usuario o carrito no son válidos");
                }
            }
            catch (Exception ex)
            {                
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
     
        }

        private void dataBindVentas()
        {
            ColeccionVenta PxCs = new ColeccionVenta();
            List<Venta> PxC = PxCs.ListarTodos();
            if (PxC.Count() > 0)
            {
                gvListar.DataSource = PxC;
                gvListar.DataBind();
                lblListar.Text = "";
            }
            else
            {
                lblListar.Text = "No hay elementos para mostrar";
                gvListar.DataSource = null;
                gvListar.DataBind();
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Venta v = new Venta();
                Carrito c = new Carrito();
                Usuario u = new Usuario();
                if (c.ReadByCod(int.Parse(txtCodCarrito.Text)) && u.ReadByRut(txtRutUsuario.Text))
                {
                    v.codVenta = int.Parse(txtCodVenta.Text);
                    v.carrito = c;
                    v.usuario = u;   
                    v.Update();
                    limpiar();
                    dataBindVentas();
                }
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                Venta v = new Venta();
                if (v.ReadByCod(int.Parse(txtCodVenta.Text)))
                {
                    v.Delete();
                    limpiar();
                    dataBindVentas();

                }
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }

        private void limpiar()
        {
            lblMessage.Text = String.Empty;
            lblListar.Text = String.Empty;
            txtCodCarrito.Text = String.Empty;
            txtCodVenta.Text = String.Empty;
            txtRutUsuario.Text = String.Empty;
           
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            try
            {
                Venta v = new Venta();
                if (v.ReadByCod(int.Parse(txtCodVenta.Text)))
                {
                    txtCodCarrito.Text = v.carrito + "";
                    txtRutUsuario.Text = v.usuario.rut;
                    txtCodVenta.Text = v.codVenta+"";
                    txtCodCarrito.Text = v.carrito.codigoCarrito + "";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }

        }
    }
}