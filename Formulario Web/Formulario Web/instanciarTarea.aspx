<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="instanciarTarea.aspx.vb" Inherits="Formulario_Web.instanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 66%;
            height: 370px;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            text-align: center;
            height: 76px;
        }
        .auto-style5 {
            width: 114px;
        }
        .auto-style6 {
            width: 124px;
            text-align: center;
        }
        .auto-style8 {
            width: 114px;
            height: 24px;
        }
        .auto-style9 {
            height: 24px;
        }
        .auto-style10 {
            width: 124px;
            height: 24px;
        }
        .auto-style11 {
            width: 124px;
        }
        .auto-style12 {
            width: 114px;
            height: 40px;
        }
        .auto-style13 {
            height: 40px;
        }
        .auto-style14 {
            width: 124px;
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="3"><span class="auto-style2">ALUMNOS</span><br class="auto-style2" />
                    <span class="auto-style2">INSTANCIAR TAREA GENÉRICA</span></td>
            </tr>
            <tr>
                <td class="auto-style10">Usuario</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox1" runat="server" Width="269px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style11">Tarea</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server" Width="267px" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">Horas Est.</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox3" runat="server" Width="265px" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">Horas reales</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server" Width="263px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Introduzca un número</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" rowspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Crear Tarea" Height="46px" />
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style14">
                    </td>
                <td class="auto-style12">
                    <asp:Label ID="Label1" runat="server" Text="Instanciación correcta" Width="270px" Visible="False"></asp:Label>
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/tareasAlumno.aspx">Página anterior</asp:LinkButton>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <asp:GridView ID="gvTareas" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
    </body>
</html>
