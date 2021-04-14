<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="profesor.aspx.vb" Inherits="Formulario_Web.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 472px;
        }
        .auto-style2 {
            width: 278px;
        }
        .auto-style3 {
            text-align: center;
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton1" runat="server">Asignaturas</asp:LinkButton>
                    </td>
                    <td class="auto-style3" rowspan="6"><strong>Gestión Web de Tareas - Dedicación<br />
                        <br />
                        Profesores</strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton2" runat="server">Tareas</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton3" runat="server">Grupos</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/ImportarTareasXMLDocument.aspx">Importar v.XMLDocument</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/exportarTarea.aspx">Exportar</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkButton6" runat="server">Importar v.DataSet</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
