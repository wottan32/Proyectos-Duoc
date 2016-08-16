using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FactoryPC.Negocio;

namespace FactoryPC.Web.producto
{
    public partial class agregarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            dataBind();
        }

        private Producto recuperarProducto() {
            Producto p = new Producto();
            p.codProducto = int.Parse(txtCodigo.Text);
            p.nombre = TxtNombre.Text;
            p.precio = int.Parse(txtPrecio.Text);
            return p;
        }


        protected void bntAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                recuperarProducto().Create();
                limpiar();
                dataBind();
                lblMessage.Text = "Producto agregado con éxito";
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


        private void dataBind() {
            ColeccionProducto productos = new ColeccionProducto();
            List<Producto> prod = productos.ListarTodos();
            if (prod.Count() != 0)
            {
                gvProductos.DataSource = prod;
                gvProductos.DataBind();
            }
            else
            {
                lblListar.Text = "No hay elementos para mostrar";
            }
        }

        private void limpiar()
        {
            txtCodigo.Text = String.Empty;
            TxtNombre.Text = String.Empty;
            txtPrecio.Text = String.Empty;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                recuperarProducto().Update();
                lblMessage.Text = "Producto modificado con éxito";

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
                recuperarProducto().Delete();
                lblMessage.Text = "Producto eliminado con éxito";
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }
    }
}