using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Banco.Web
{
    public partial class RealixarTransferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTransferir_Click(object sender, EventArgs e)
        {
            try
            {
                BancoSvc.BancoServClient BancoServ = new BancoSvc.BancoServClient();
                if (BancoServ.AgergarTransferencia(int.Parse(txtIdTransferencia.Text), User.Identity.Name, txtRutDestinatario.Text, int.Parse(txtNroCuenta.Text), int.Parse(txtMonto.Text)))
                {
                    lblMensaje.Text = "transferencia realizada con éxito";
                }
  
                

            }
            catch (Exception ex)
            {  
                lblMensaje.Text = "Opps ha ocurrido un error : " +ex.Message;

            }
        }
    }
}