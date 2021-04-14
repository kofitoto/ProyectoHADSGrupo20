<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="tareasAlumno.aspx.vb" Inherits="Formulario_Web.WebForm3" EnableSessionState="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style6 {
            margin-bottom: 0px;
        }
        .auto-style7 {
            width: 98px;
        }
        .auto-style8 {
            font-size: xx-large;
        }
        .auto-style9 {
            text-align: center;
        }
    </style>
</head>
<body onload="window.history.forward()">
    <form id="form2" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">
                        <asp:LinkButton ID="LinkButton1" runat="server">Cerrar sesión</asp:LinkButton>
                    </td>
                <td class="auto-style9" colspan="2"><span class="auto-style8"><strong>ALUMNOS</strong></span><strong><br class="auto-style8" />
                    </strong><span class="auto-style8"><strong>GESTIÓN DE TAREAS GENÉRICAS</strong></span></td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style9" colspan="2">Seleccionar asignaturas (sólo se muestran aquellas en las que esta matriculado):</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>
                        <asp:DropDownList ID="dropAsig" runat="server" DataTextField="codigoasig" DataValueField="codigoasig" AutoPostBack="True" CssClass="auto-style6">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>
                        <asp:GridView ID="gvTab" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                            <Columns>
                                <asp:CommandField ButtonType="Button" SelectText="Instanciar" ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                    </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
