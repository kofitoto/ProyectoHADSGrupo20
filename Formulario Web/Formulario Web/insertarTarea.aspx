<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insertarTarea.aspx.vb" Inherits="Formulario_Web.insertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 604px;
            position: relative;
            left: 0px;
            top: 0px;
        }
        .auto-style2 {
            text-align: center;
            height: 155px;
        }
        .auto-style3 {
            font-size: xx-large;
        }
        .auto-style4 {
            width: 187px;
        }
        .auto-style5 {
            width: 870px;
        }
        .auto-style7 {
            width: 187px;
            text-align: center;
        }
        .auto-style8 {
            width: 187px;
            height: 46px;
        }
        .auto-style9 {
            width: 870px;
            height: 46px;
        }
        .auto-style10 {
            height: 46px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="3"><strong><span class="auto-style3">PROFESOR</span><br class="auto-style3" />
                        <span class="auto-style3">GESTIÓN DE TAREAS GENÉRICAS</span></strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">Código:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ForeColor="Red">Introduzca un código</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Descripción:</td>
                    <td class="auto-style5" rowspan="3">
                        <asp:TextBox ID="TextBox2" runat="server" Height="74px" TextMode="MultiLine" Width="744px"></asp:TextBox>
                    </td>
                    <td rowspan="3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Inserte una descripción</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Asignatura:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="dropAsigP" runat="server" DataTextField="codigo" DataValueField="codigo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-20ConnectionString %>" SelectCommand="SELECT [codigo] FROM [Asignaturas]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Horas Estimadas:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Introduzca tiempo </asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style10"></td>
                </tr>
                <tr>
                    <td class="auto-style4">Tipo Tarea:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="dropTareaP" runat="server" DataTextField="TipoTarea" DataValueField="TipoTarea">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS21-20ConnectionString %>" SelectCommand="SELECT DISTINCT TipoTarea FROM TareasGenericas"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" rowspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Añadir Tarea" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/tareasProfesor.aspx">Ver Tarea</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
