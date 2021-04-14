Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim x = CType(Application.Contents("Logueados"), AccesoDatos.AccesoDatos)
        Dim alumnos = x.getsAlumnosLoguedo
        Dim profesores = x.getprofesoresLoguedo
        Dim nProf = x.getNumProfesores
        Label5.Text = nProf.ToString
        Dim nAlum = x.getNumAlumnos
        Label4.Text = nAlum.ToString
        ListBox2.Items.Clear()
        ListBox3.Items.Clear()
        For Each a In alumnos
            ListBox2.Items.Add(e.ToString)
        Next
        For Each p In profesores
            ListBox3.Items.Add(e.ToString)
        Next
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

    End Sub
End Class