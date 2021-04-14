<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="registro.aspx.vb" Inherits="Formulario_Web.registro" %>

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
            width: 130px;
        }
        .auto-style3 {
            width: 130px;
            height: 30px;
        }
        .auto-style4 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Introduzca un correo</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox1" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Direccion incorrecta</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox2" ForeColor="#FF3300">Introduce un nombre</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Apellidos"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox3" ForeColor="#FF3300">Introduce un apellidos</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Inserte una contraseña</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator2" ValidationExpression="^\w{3,14}$" ControlToValidate="TextBox4" ForeColor="Red">contraseña entre 4y 8 digitos y minimo un numero</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Repetir Psw"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Inserte una contraseña</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ForeColor="#FF3300">Contraseñas deben coincidir</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Text="Rol"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Selected="True">Alumno</asp:ListItem>
                            <asp:ListItem>Profesor</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="Registrar" />
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" ForeColor="Lime" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
