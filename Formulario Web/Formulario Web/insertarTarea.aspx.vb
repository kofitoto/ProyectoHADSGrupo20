Imports System.Data.SqlClient

Public Class insertarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        IniciarLlenadoTipoTarea()
        IniciarLlenadoAsignatura()
    End Sub

    Protected Sub IniciarLlenado()
        Dim emailUsuario As String = Session("emailUsuario")
        Dim asignaturas As SqlCommand

        Dim v As New AccesoDatos.AccesoDatos()

        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        asignaturas = AccesoDatos.AccesoDatos.llenarProfesor(emailUsuario)

        ''dropAsigP.DataTextField = "codigoasig"

        da = New SqlDataAdapter(asignaturas)
        da.Fill(ds)

        dropAsigP.DataSource = ds
        dropAsigP.DataBind()

    End Sub

    Protected Sub IniciarLlenadoAsignatura()
        If Not IsPostBack Then
            Dim asignaturas As SqlCommand

            Dim v As New AccesoDatos.AccesoDatos()

            Dim ds As New DataSet
            Dim da As New SqlDataAdapter

            asignaturas = AccesoDatos.AccesoDatos.Asignaturas()

            'dropTareaP.DataTextField = "codigo"

            da = New SqlDataAdapter(asignaturas)
            da.Fill(ds)

            dropAsigP.DataSource = ds
            dropAsigP.DataBind()
        End If
    End Sub

    Protected Sub IniciarLlenadoTipoTarea()
        If Not IsPostBack Then
            Dim tareas As SqlCommand

            Dim v As New AccesoDatos.AccesoDatos()

            Dim ds As New DataSet
            Dim da As New SqlDataAdapter

            tareas = AccesoDatos.AccesoDatos.TipoTarea()

            'dropTareaP.DataTextField = "TipoTarea"

            da = New SqlDataAdapter(tareas)
            da.Fill(ds)

            dropTareaP.DataSource = ds
            dropTareaP.DataBind()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim val = AccesoDatos.AccesoDatos.insertarTarea(TextBox1.Text, TextBox2.Text, dropAsigP.SelectedValue, TextBox3.Text, dropTareaP.SelectedValue)
        If val = 1 Then
            MsgBox("Tarea insertada correctamente")
        Else
            MsgBox("Ups.. ha habido un error vuelve a intentarlo")
        End If
    End Sub
End Class