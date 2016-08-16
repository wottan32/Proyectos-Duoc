using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banco.Web
{
    public partial class ModificarNombre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BancoSvc.BancoServClient BancoServ = new BancoSvc.BancoServClient();
            lblNombreActual.Text = BancoServ.buscarCliente(User.Identity.Name).nombreCompleto;
        }

        protected void btnModificarNombre_Click(object sender, EventArgs e)
        {
            try
            {
                BancoSvc.BancoServClient BancoServ = new BancoSvc.BancoServClient();
                if (BancoServ.UpdateNombreUsuario(User.Identity.Name, txtNombreNuevo.Text))
                {
                    lblMensaje.Text = "Nombre actualizado con éxito";
                    lblNombreActual.Text = BancoServ.buscarCliente(User.Identity.Name).nombreCompleto;
                }
                           
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Opps ha ocurrido un error : " +ex.Message;
            }
        }
    }
}