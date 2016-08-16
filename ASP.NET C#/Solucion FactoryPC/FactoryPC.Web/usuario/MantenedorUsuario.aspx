<%@ Page Title="" Language="C#" MasterPageFile="~/web.Master" AutoEventWireup="true" CodeBehind="MantenedorUsuario.aspx.cs" Inherits="FactoryPC.Web.usuario.MantenedorUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Mantenedor Usuario</h1>
    <table style="width: 100%;">
            <tr>
            <td>
                Rut
            </td>
            <td>
                <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                <asp:Button ID="btnRecuperar" runat="server" onclick="btnRecuperar_Click" 
                    Text="Recuperar" CausesValidation="false" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtRut"
                    ErrorMessage="Por favor ingrese un rut" />
            </td>
        </tr>
        <tr>
            <td>
                Nombre
            </td>
            <td>
                <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TxtNombre"
                    ErrorMessage="Por favor ingrese un nombre" />
            </td>
        </tr>
        <tr>
            <td>
                Apellido
            </td>
            <td>
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtApellido"
                    ErrorMessage="Por favor ingrese un apellido" />
            </td>
        </tr>

        <tr>
            <td>
                Email
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtEmail"
                    ErrorMessage="Por favor ingrese un email" />
            </td>
        </tr>
        <tr>
            <td>
                Teléfono
            </td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtTelefono"
                    ErrorMessage="Por favor ingrese un teléfono" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>            
            <td colspan="2">
                <asp:Button ID="bntAgreagar" runat="server" Text="Agreagar" 
                    OnClick="bntAgreagar_Click" />
                <asp:Button ID="btnModificar" runat="server" onclick="btnModificar_Click" 
                    Text="Modificar" />
                <asp:Button ID="btnEliminar" runat="server" onclick="btnEliminar_Click" 
                    Text="Eliminar" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
    </table>
            <asp:Panel ID="pnlUsuarios" runat="server">
        <div>
            <h2>Lista de Usuarios</h2>
        </div>
        <div class="container">
            <asp:Label ID="lblListar" runat="server" Text=""></asp:Label>
            <asp:GridView ID="gvUsuarios" runat="server" CellPadding="4" 
                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:BoundField DataField="rut" HeaderText="Rut" SortExpression="rut" />
                    <asp:BoundField DataField="nombres" HeaderText="Nombres" 
                        SortExpression="nombres" />
                    <asp:BoundField DataField="apellidos" HeaderText="Apellidos" 
                        SortExpression="apellidos" />
                    <asp:BoundField DataField="telefono" HeaderText="Telefono" 
                        SortExpression="telefono" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
    </asp:Panel>
</asp:Content>
