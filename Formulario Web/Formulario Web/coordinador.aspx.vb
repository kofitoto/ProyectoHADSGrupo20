Public Class coordinador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim u As New media
        If Not u.Hmedia(DropDownList1.SelectedValue) < 0 Then
            Label1.Text = "La dedicacion media de la asignatura es: " + u.Hmedia(DropDownList1.SelectedValue)
            Label1.ForeColor = Drawing.Color.Green
            Label1.Visible = True
        Else
            Label1.Text = "No existe una dedicacion media para la asignatura (" + DropDownList1.SelectedValue + ") seleccionada"
            Label1.ForeColor = Drawing.Color.Red
            Label1.Visible = True
        End If

    End Sub
End Class