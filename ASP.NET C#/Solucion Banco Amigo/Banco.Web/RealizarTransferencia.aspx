<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="RealizarTransferencia.aspx.cs" Inherits="Banco.Web.RealixarTransferencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
            Realizar Transferencia</h1>
    <table style="width: 100%;">
       
        <tr>
            <td>
                Id Transferencia
            </td>
            <td>
                <asp:TextBox ID="txtIdTransferencia" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTransferencia" ControlToValidate="txtIdTransferencia"
                    runat="server" ErrorMessage="Ingrese una id de transferencia"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Rut Destinatario
            </td>
            <td>
                <asp:TextBox ID="txtRutDestinatario" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRutDestinatario" ControlToValidate="txtRutDestinatario"
                    runat="server" ErrorMessage="Ingrese rut de destinatario"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Nro Cuenta Destinatario
            </td>
            <td>
                <asp:TextBox ID="txtNroCuenta" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNroCuenta" ControlToValidate="txtNroCuenta" runat="server"
                    ErrorMessage="Ingrese un nro de cuenta"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Monto
            </td>
            <td>
                <asp:TextBox ID="txtMonto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMonto" ControlToValidate="txtMonto" runat="server"
                    ErrorMessage="Ingrese un monto"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnTransferir" runat="server" Text="Transferir" 
                    onclick="btnTransferir_Click" /><asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
