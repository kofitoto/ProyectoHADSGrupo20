Imports System.Data.SqlClient
Imports System.Web
Public Class confirmar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Mail = Request.QueryString("mail")
        Dim codigo = Convert.ToInt32(Request.QueryString("codigo"))
        Dim val = AccesoDatos.AccesoDatos.confirmar(Mail, codigo)
        If val = 1 Then
            Label1.Text = "Te has confirmado correctamente!"
            Label1.ForeColor = Drawing.Color.Green
            Label1.Visible = True
            'MsgBox("Te has confirmado correctamente!")
        Else
            Label1.Text = "No se ha podido confirmar consulte nuestro soporte tecnico"
            Label1.BorderColor = Drawing.Color.Red
            Label1.Visible = True
            'MsgBox("No se ha podido confirmar consulte nuestro soporte tecnico")
        End If
    End Sub
End Class