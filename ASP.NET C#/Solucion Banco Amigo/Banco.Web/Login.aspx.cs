using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Banco.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginForn_Authenticate(object sender, AuthenticateEventArgs e)
        {

            BancoSvc.BancoServClient banco = new BancoSvc.BancoServClient();
            bool valido = banco.VerificarCliente(loginForn.UserName, loginForn.Password);
            if (valido)
            {
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(loginForn.UserName, loginForn.RememberMeSet);
            }

        }

    }
}