using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FactoryPC.Negocio;

namespace FactoryPC.Web.usuario
{
    public partial class MantenedorUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dataBind();
            }

        }

        private Usuario recuperarUsuario()
        {

            Usuario u = new Usuario();

            u.nombres = TxtNombre.Text;
            u.apellidos = txtApellido.Text;
            u.rut = txtRut.Text;
            u.telefono = txtTelefono.Text;
            u.email = txtEmail.Text;
            return u;

        }

        protected void bntAgreagar_Click(object sender, EventArgs e)
        {
            try
            {
                recuperarUsuario().Create();
                dataBind();
                limpiar();
                lblListar.Text = String.Empty;
                lblMessage.Text = "Usuario registrado con éxito";
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }

        private void limpiar()
        {
            TxtNombre.Text = String.Empty;
            txtApellido.Text = String.Empty;
            txtRut.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        private void dataBind()
        {
            ColeccionUsuario productos = new ColeccionUsuario();
            List<Usuario> usr = productos.ListarTodos();
            if (usr.Count() != 0)
            {
                gvUsuarios.DataSource = usr;
                gvUsuarios.DataBind();
            }
            else
            {
                lblListar.Text = "No hay elementos para mostrar";
                gvUsuarios.DataSource = null;
                gvUsuarios.DataBind();
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                recuperarUsuario().Update();
                lblMessage.Text = "Usuario modificado con éxito";
                dataBind();
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
                recuperarUsuario().Delete();
                lblMessage.Text = "Usuario eliminado con éxito";
                dataBind();

            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario();
            if (u.ReadByRut(txtRut.Text))
            {
                TxtNombre.Text = u.nombres;
                txtApellido.Text = u.apellidos;
                txtEmail.Text = u.email;
                txtTelefono.Text = u.telefono;
                
	}
        }
    }
}