<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="confirmar.aspx.vb" Inherits="Formulario_Web.confirmar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" CausesValidation="False" PostBackUrl="~/inicio.aspx" Text="Login" />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
