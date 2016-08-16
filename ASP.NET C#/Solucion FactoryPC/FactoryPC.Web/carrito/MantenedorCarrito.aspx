<%@ Page Title="" Language="C#" MasterPageFile="~/web.Master" AutoEventWireup="true"
    CodeBehind="MantenedorCarrito.aspx.cs" Inherits="FactoryPC.Web.carrito.MantenedorCarrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>
            Mantenedor Carrito</h1>
    </div>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Panel ID="pnlNombreInstancia" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    Código Carrito
                </td>
                <td>
                    <asp:TextBox ID="txtCodCarrito" runat="server"></asp:TextBox>
                    <asp:Button ID="bntContinuar" runat="server" Text="Agregar o Modificar" OnClick="bntContinuar_Click" />
                    <asp:Button ID="btnEliminarCarrito" runat="server" OnClick="btnEliminarCarrito_Click"
                        Text="Eliminiar" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtCodCarrito"
                        ErrorMessage="Ingrese el código del carrito" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlAgregarObjetos" runat="server" Visible="false">
        <table style="width: 100%;">
            <tr>
                <td>
                    Código Producto
                </td>
                <td>
                    <asp:TextBox ID="TxtCodProducto" runat="server"></asp:TextBox>
                </td>
                <td>
                    Cantidad
                </td>
                <td>
                    <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                    
                </td>
                <td>
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TxtCodProducto"
                        ErrorMessage="Ingrese el código de el producto" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtCantidad"
                        ErrorMessage="Ingrese la cantidad de Productos" />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Button ID="btnTerminar" runat="server" Text="Terminar" OnClick="btnTerminar_Click"
                        CausesValidation="False" />
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlListarProdAgregados" runat="server">
            <div>
                <h2>
                    Lista de Productos en este Carrito</h2>
            </div>
            <div class="container">
                <asp:Label ID="lblListarAgregados" runat="server" Text=""></asp:Label>
                <asp:GridView ID="gvListaProductosCarrito" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="codProducto" HeaderText="Código Producto" SortExpression="codProducto" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" />
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
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
    </asp:Panel>
    <asp:Panel ID="pnlListarProductos" runat="server">
        <div>
            <h2>
                Lista de Carritos</h2>
        </div>
        <div class="container">
            <asp:Label ID="lblListar" runat="server" Text=""></asp:Label>
            <asp:GridView ID="gvCarritos" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="codigoCarrito" HeaderText="Código Carrito" SortExpression="codigoCarrito" />
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
