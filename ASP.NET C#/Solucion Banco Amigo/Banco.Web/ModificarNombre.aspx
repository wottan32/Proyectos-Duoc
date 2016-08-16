<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true"
    CodeBehind="ModificarNombre.aspx.cs" Inherits="Banco.Web.ModificarNombre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Modificar Nombre</h1>
    <table style="width: 100%;">
        <tr>
            <td>
                Nombre Actual
            </td>
            <td>
                <asp:Label ID="lblNombreActual" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Nombre Nuevo
            </td>
            <td>
                <asp:TextBox ID="txtNombreNuevo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreNuevo" ErrorMessage="Ingrese un nombre"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnModificarNombre" runat="server" Text="Guardar" 
                    onclick="btnModificarNombre_Click" />
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
