<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="exportarTarea.aspx.vb" Inherits="Formulario_Web.exportarTarea" %>

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
        .auto-style5 {
            height: 23px;
        }
        .auto-style4 {
            height: 24px;
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
                    <td class="auto-style5"><strong>Seleccionar asignatura a exportar:</strong></td>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-20ConnectionString %>" SelectCommand="SELECT tg.Codigo, tg.Descripcion, tg.HEstimadas, tg.Explotacion, tg.TipoTarea FROM TareasGenericas tg Where CodAsig = @dropAsig">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dropAsigP" Name="dropAsig" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
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
                        <asp:Button ID="Button1" runat="server" Text="Exportar (XML)" Height="44px" Width="196px" />
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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="Label2" runat="server" ForeColor="#00CC00" Text="Exportacion completada! Consulta el directorio App_Data." Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </body>
</html>
