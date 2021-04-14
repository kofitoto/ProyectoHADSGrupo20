<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="tareasProfesor.aspx.vb" Inherits="Formulario_Web.tareasProfesor" %>

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
    </style>
</head>
<body onload="window.history.forward()">
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2"><span class="auto-style3"><strong>PROFESOR</strong></span><strong><br class="auto-style3" />
                        </strong><span class="auto-style3"><strong>GESTIÓN DE TAREAS GENÉRICAS</strong></span></td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server">Cerrar sesión</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><strong>Seleccionar asignatura:</strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="dropAsigP" runat="server" AutoPostBack="True" DataTextField="codigoasig" DataValueField="codigoasig" DataSourceID="SqlDataSource1">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-20ConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM ProfesoresGrupo INNER JOIN GruposClase ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE (ProfesoresGrupo.email = @emailUsuario)">
                            <SelectParameters>
                                <asp:SessionParameter Name="emailUsuario" SessionField="emailUsuario" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT tg.Codigo, tg.Descripcion, tg.HEstimadas, tg.TipoTarea FROM TareasGenericas tg Where CodAsig = @dropAsig" ConnectionString="<%$ ConnectionStrings:HADS21-20ConnectionString %>">
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
                        <asp:Button ID="Button1" runat="server" Text="Insertar Tarea" Height="44px" Width="196px" PostBackUrl="~/insertarTarea.aspx" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="Codigo">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                                <asp:CommandField ShowEditButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
