<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasXMLDocument.aspx.vb" Inherits="Formulario_Web.ImportarTareasXMLDocument" %>

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
            text-align: center;
        }
        .auto-style3 {
            font-size: xx-large;
        }
        .auto-style4 {
            height: 24px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            height: 41px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2"><span class="auto-style3"><strong>PROFESOR</strong></span><strong><br class="auto-style3" />
                        </strong><span class="auto-style3"><strong>GESTIÓN DE TAREAS GENÉRICAS</strong></span></td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/profesor.aspx">Menu Profesor</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Seleccionar asignatura:</strong></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="dropAsigP" runat="server" AutoPostBack="True" DataTextField="codigoasig" DataValueField="codigoasig">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Importar(XMLD)" Height="44px" Width="196px" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text="Lista de asignaturas de la asignatura seleccionada:"></asp:Label>
                        <br />
                        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
                        <asp:Label ID="Label2" runat="server" ForeColor="#00CC00" Text="Importacion completada!" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
