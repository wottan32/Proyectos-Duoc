<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Banco.Web.AreaPrivada.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     Bienvenido <asp:LoginName ID="nombreUsuario" runat="server" />
     <h1>Historial de transferencias</h1>
    <asp:GridView ID="gvTransferencias" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="idTransferencia" HeaderText="Id Transferencia" 
                SortExpression="idTransferencia" />
            <asp:BoundField DataField="rutDestinatario" HeaderText="Rut Destinatario" 
                SortExpression="rutDestinatario" />
            <asp:BoundField DataField="nroCuentaDestinatario" 
                HeaderText="Nº Cuenta Destinatario" SortExpression="nroCuentaDestinatario" />
            <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" />
        </Columns>
    </asp:GridView>
</asp:Content>
