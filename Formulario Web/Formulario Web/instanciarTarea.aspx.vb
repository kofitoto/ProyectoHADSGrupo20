Imports System.Data.SqlClient

Public Class instanciarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim emailUsuario As String = Session("emailUsuario")
        TextBox1.Text = emailUsuario
        GetRouteUrl("instanciarTarea.aspx")
        Dim val As String
        val = Request.QueryString("codtarea").ToString
        TextBox2.Text = val
        Dim val2 As String
        val2 = Request.QueryString("horas").ToString
        TextBox3.Text = val2
        inicioDeTabla()


    End Sub



    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("tareasAlumno.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim emailUsuario As String = Session("emailUsuario")
        Dim hreal As String
        hreal = TextBox4.Text
        Dim cod As String
        cod = Request.QueryString("codtarea").ToString
        Dim hest As String
        hest = TextBox3.Text

        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        Dim val = AccesoDatos.AccesoDatos.insertarTareaAlumno(emailUsuario, cod, hest, hreal)

        If IsPostBack And val = 1 Then
            MsgBox("Se ha instanciado la tarea correctamente")
            Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
        Else
            MsgBox("Upss algo ha salido mal !")
        End If
    End Sub

    Protected Sub inicioDeTabla()
        Dim emailUsuario As String = Session("emailUsuario")
        Dim hReal As String
        hReal = TextBox4.Text
        Dim act As DataSet
        act = AccesoDatos.AccesoDatos.tablaEntradaInstanciada(emailUsuario)
        gvTareas.DataSource = act
        gvTareas.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvTareas.SelectedIndexChanged

    End Sub
End Class