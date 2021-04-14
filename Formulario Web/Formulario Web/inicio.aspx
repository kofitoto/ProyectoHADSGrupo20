<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="inicio.aspx.vb" Inherits="Formulario_Web.WebForm1" EnableSessionState="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 230px;
        }
        .auto-style3 {
            width: 230px;
            height: 50px;
        }
        .auto-style4 {
            height: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Introduzca un correo</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Direccion Incorrecta</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Inserte una contraseña</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^\w{3,14}$">contraseña entre 4y 8 digitos y minimo un numero</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="Login" />
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/registro.aspx">Registrar</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" PostBackUrl="~/cambiarpassword.aspx">Modificar Contraseña</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label3" runat="server" ForeColor="#00CC00" Text="Logueo Correcto!" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
