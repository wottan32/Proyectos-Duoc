using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banco.Web
{
    public partial class EliminarTransferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                BancoSvc.BancoServClient BancoServ = new BancoSvc.BancoServClient();
                if (BancoServ.EliminarTransferencia(int.Parse(txtIdTransderencia.Text)))
                {
                    lblMensaje.Text = "Transferencia eliminada con éxito";
                }
                               
            }
            catch (Exception ex)
            {                
                lblMensaje.Text = "Opps ha ocurrido un error : " +ex.Message;
            }
        }
    }
}