Imports System.Data.SqlClient

Public Class tareasProfesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' If (Not IsPostBack) Then
        'IniciarLlenado()
        'End If

        'cargarTareasTabla()

    End Sub

    'Protected Sub IniciarLlenado()
    '    Dim emailUsuario As String = Session("emailUsuario")
    '    Dim asignaturas As SqlCommand

    '    Dim v As New AccesoDatos.AccesoDatos()

    '    Dim ds As New DataSet
    '    Dim da As New SqlDataAdapter

    '    asignaturas = AccesoDatos.AccesoDatos.llenarProfesor(emailUsuario)


    '    da = New SqlDataAdapter(asignaturas)
    '    da.Fill(ds)

    '    dropAsigP.DataSource = ds 'LLenamos el dropList de la interfaz
    '    dropAsigP.DataBind()

    'End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        FormsAuthentication.SignOut()
        Session.Abandon()
        Response.Redirect("inicio.aspx")

    End Sub

    'Public Sub cargarTareasTabla()
    '    Dim emailUsuario As String = Session("emailUsuario")
    '    Dim tareas As SqlCommand
    '    Dim ds As New DataSet
    '    Dim da As New SqlDataAdapter
    '    tareas = AccesoDatos.AccesoDatos.tareasAlumnos(dropAsigP.SelectedValue, emailUsuario)

    '    da = New SqlDataAdapter(tareas)
    '    da.Fill(ds)

    '    Session.Add("dAdapProf", da)
    '    Session.Add("dSetProf", ds)

    '    gvTabP.DataSource = ds  'Llenamos la tabla gridview definido en la interfaz con la id gvTabP
    '    gvTabP.DataBind()


    'End Sub

End Class