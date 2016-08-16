<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Banco.Web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="loginForn" runat="server" 
    onauthenticate="loginForn_Authenticate" BackColor="#FFFBD6" 
    BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
    Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" 
    TextLayout="TextOnTop">
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" 
        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
    <TextBoxStyle Font-Size="0.8em" />
    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" 
        ForeColor="White" />
</asp:Login>
</asp:Content>
