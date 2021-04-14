Public Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim x = CType(Application.Contents("Logueados"), AccesoDatos.AccesoDatos)
        Dim alumnos = x.getsAlumnosLoguedo
        Dim profesores = x.getprofesoresLoguedo
        Dim nProf = x.getNumProfesores
        Label3.Text = nProf.ToString
        Dim nAlum = x.getNumAlumnos
        Label4.Text = nAlum.ToString
        ListBox1.Items.Clear()
        ListBox2.Items.Clear()
        For Each a In alumnos
            ListBox1.Items.Add(e.ToString)
        Next
        For Each p In profesores
            ListBox2.Items.Add(e.ToString)
        Next
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("tareasProfesor.aspx")
    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click

    End Sub



    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

    End Sub
End Class