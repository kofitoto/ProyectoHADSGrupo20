Imports System.Data.SqlClient

Public Class WebForm3
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not IsPostBack) Then
            IniciarLlenado()

        End If

        cargarTareasTabla()
    End Sub

    Protected Sub IniciarLlenado()
        Dim emailUsuario As String = Session("emailUsuario")
        ''Dim email As String = "pepe@ikasle.ehu.es"
        Dim asignaturas As SqlCommand

        Dim v As New AccesoDatos.AccesoDatos()

        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        asignaturas = AccesoDatos.AccesoDatos.llenarAlumno(emailUsuario)

        ''dropAsig.DataTextField = "codigoasig"

        da = New SqlDataAdapter(asignaturas)
        da.Fill(ds)

        dropAsig.DataSource = ds
        dropAsig.DataBind()

    End Sub

    Protected Sub dropAsig_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropAsig.SelectedIndexChanged

    End Sub


    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        FormsAuthentication.SignOut()
        Session.Abandon()
        Response.Redirect("inicio.aspx")
    End Sub


    Public Sub cargarTareasTabla()
        Dim emailUsuario As String = Session("emailUsuario")
        Dim tareas As SqlCommand
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        tareas = AccesoDatos.AccesoDatos.tareasAlumnos(dropAsig.SelectedValue, emailUsuario)

        da = New SqlDataAdapter(tareas)
        da.Fill(ds)

        Session.Add("dAdapAlum", da)
        Session.Add("dSetAlum", ds)
        gvTab.DataSource = ds
        gvTab.DataBind()


    End Sub

    Protected Sub gvTab_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvTab.SelectedIndexChanged
        Dim codtarea As String
        Dim horas As String
        codtarea = gvTab.SelectedRow.Cells(1).Text
        horas = gvTab.SelectedRow.Cells(3).Text
        Response.Redirect($"instanciarTarea.aspx?codtarea={codtarea}&horas={horas}")
    End Sub
End Class