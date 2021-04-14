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
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 557px;
        }
        .auto-style6 {
            width: 557px;
            height: 40px;
        }
        .auto-style7 {
            height: 40px;
        }
        .auto-style8 {
            width: 557px;
            height: 174px;
        }
        .auto-style9 {
            height: 174px;
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
        <table class="auto-style4">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Text="Alumnos conectados:"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Profesores conectados:"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
                <td>
                    <asp:Timer ID="Timer1" runat="server" Interval="3000">
                    </asp:Timer>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td class="auto-style9">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:ListBox ID="ListBox2" runat="server"></asp:ListBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7"></td>
            </tr>
        </table>
    </form>
</body>
</html>
