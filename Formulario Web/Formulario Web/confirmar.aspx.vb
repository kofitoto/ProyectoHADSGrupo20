Imports System.Data.SqlClient
Imports System.Web
Public Class confirmar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Mail = Request.QueryString("mail")
        Dim codigo = Convert.ToInt32(Request.QueryString("codigo"))
        Dim val = AccesoDatos.AccesoDatos.confirmar(Mail, codigo)
        If val = 1 Then
            MsgBox("Te has confirmado correctamente!")
            Response.Redirect("inicio.aspx")
        Else
            MsgBox("No se ha podido confirmar consulte nuestro soporte tecnico")
        End If
    End Sub
End Class