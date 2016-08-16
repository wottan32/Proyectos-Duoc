<%@ Page Title="" Language="C#" MasterPageFile="~/web.Master" AutoEventWireup="true" CodeBehind="MantenedorProducto.aspx.cs" Inherits="FactoryPC.Web.producto.agregarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <h1>Mantenedor de Producto</h1>
        </div>
    <table style="width: 100%;">
        <tr>
            <td>
                Código
            </td>
            <td>
                <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtCodigo"
                    ErrorMessage="Ingrese el código del producto" />
            </td>
        </tr>
        <tr>
            <td>
                Nombre
            </td>
            <td>
                <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TxtNombre"
                    ErrorMessage="Ingrese el nombre del producto" />
            </td>
        </tr>
        <tr>
            <td>
                Precio
            </td>
            <td>
                <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPrecio"
                    ErrorMessage="Ingrese el precio del producto" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>            
            <td colspan="2">
                <asp:Button ID="bntAgregar" runat="server" Text="Agregar" OnClick="bntAgregar_Click" />
                <asp:Button ID="btnModificar" runat="server" onclick="btnModificar_Click" 
                    Text="Modificar" />
                <asp:Button ID="btnEliminar" runat="server" onclick="btnEliminar_Click" 
                    style="height: 26px" Text="Eliminar" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" />
            </td>
        </tr>
    </table>
        <asp:Panel ID="pnlListarProductos" runat="server">
        <div>
            <h2>Lista de Productos</h2>
        </div>
        <div class="container">
            <asp:Label ID="lblListar" runat="server" Text=""></asp:Label>
            <asp:GridView ID="gvProductos" runat="server" CellPadding="4" 
                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="codProducto" HeaderText="Codigo de Producto" 
                        SortExpression="codProducto" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                        SortExpression="nombre" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" 
                        SortExpression="precio" />
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
