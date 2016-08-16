using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Banco.Web.AreaPrivada
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BancoSvc.BancoServClient BancoServ = new BancoSvc.BancoServClient();
            String id = User.Identity.Name;            
            nombreUsuario.FormatString = BancoServ.buscarCliente(id).nombreCompleto;            
            gvTransferencias.DataSource = BancoServ.buscarTransferenciasPorCliente(id);
            gvTransferencias.DataBind();
           

        }
    }
}