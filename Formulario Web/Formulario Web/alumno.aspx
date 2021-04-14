<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="alumno.aspx.vb" Inherits="Formulario_Web.WebForm2" EnableSessionState="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 554px;
        }
        .auto-style7 {
            font-size: xx-large;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            width: 416px;
        }
        .auto-style10 {
            width: 100%;
        }
        .auto-style11 {
            width: 617px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style9">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/tareasAlumno.aspx">Tareas Genericas</asp:LinkButton>
                    </td>
                    <td class="auto-style8" rowspan="5"><span class="auto-style7"><strong>Gestión Web de Tareas - Dedicación </strong></span><strong>
                        <br class="auto-style7" />
                        </strong><span class="auto-style7"><strong>Alumnos</strong></span></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:LinkButton ID="LinkButton2" runat="server">Tareas Propias</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:LinkButton ID="LinkButton3" runat="server">Grupos</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Localize ID="Localize1" runat="server"></asp:Localize>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <table class="auto-style10">
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" Text="Alumnos conectados:"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Profesores conectados:"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
                <td>
                    <asp:Timer ID="Timer1" runat="server" Interval="3000">
                    </asp:Timer>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:ListBox ID="ListBox2" runat="server"></asp:ListBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:ListBox ID="ListBox3" runat="server"></asp:ListBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
