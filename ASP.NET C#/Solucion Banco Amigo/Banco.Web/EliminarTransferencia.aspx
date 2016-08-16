<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="EliminarTransferencia.aspx.cs" Inherits="Banco.Web.EliminarTransferencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Eliminar Transferencia</h1>
    <table style="width: 100%;">
        <tr>
            <td>
                Id Transferencia
            </td>
            <td>
                <asp:TextBox ID="txtIdTransderencia" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvIdTransferencia" runat="server" ControlToValidate="txtIdTransderencia"
                    ErrorMessage="Ingrese la id de transferencia a eliminar"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                    onclick="btnEliminar_Click" />
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
