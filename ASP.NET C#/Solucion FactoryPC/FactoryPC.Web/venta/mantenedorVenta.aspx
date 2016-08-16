<%@ Page Title="" Language="C#" MasterPageFile="~/web.Master" AutoEventWireup="true"
    CodeBehind="mantenedorVenta.aspx.cs" Inherits="FactoryPC.Web.venta.mantenedorVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Agregar Venta</h1>
    <table style="width: 100%;">
        <tr>
            <td>
                Código Venta
            </td>
            <td>
                <asp:TextBox ID="txtCodVenta" runat="server"></asp:TextBox>
                <asp:Button ID="btnRecuperar" runat="server" onclick="btnRecuperar_Click" 
                    Text="Recuperar" CausesValidation="false" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtCodVenta"
                    ErrorMessage="Por favor ingrese el código de venta" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                Rut Usuario
            </td>
            <td class="style1">
                <asp:TextBox ID="txtRutUsuario" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtRutUsuario"
                    ErrorMessage="Por favor ingrese el rut del usuario" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                Código Carrito
            </td>
            <td class="style1">
                <asp:TextBox ID="txtCodCarrito" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtCodCarrito"
                    ErrorMessage="Por favor ingrese el código del carrito" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="bntRegistrar" runat="server" Text="Agregar" OnClick="bntAgregar_Click" />
                <asp:Button ID="btnModificar" runat="server" onclick="btnModificar_Click" 
                    Text="Modificar" />
                <asp:Button ID="btnEliminar" runat="server" onclick="btnEliminar_Click" 
                    Text="Eliminar" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click"
                    Height="26px" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="pnlListar" runat="server">
        <div>
            <h2>
                Lista de Ventas</h2>
        </div>
        <div class="container">
            <asp:Label ID="lblListar" runat="server" Text=""></asp:Label>
            <asp:GridView ID="gvListar" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="codVenta" HeaderText="Código Venta" 
                        SortExpression="codVenta" />
                    <asp:BoundField DataField="fechaVenta" HeaderText="Fecha Venta" 
                        SortExpression="fechaVenta" />
                    <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" />
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
