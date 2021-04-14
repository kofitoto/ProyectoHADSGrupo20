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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/tareasAlumno.aspx">Tareas Genericas</asp:LinkButton>
                    </td>
                    <td class="auto-style8" rowspan="4"><span class="auto-style7"><strong>Gestión Web de Tareas - Dedicación </strong></span><strong>
                        <br class="auto-style7" />
                        </strong><span class="auto-style7"><strong>Alumnos</strong></span></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server">Tareas Propias</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton3" runat="server">Grupos</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Localize ID="Localize1" runat="server"></asp:Localize>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
