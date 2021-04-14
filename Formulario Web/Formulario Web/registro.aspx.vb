Imports System.Net.Mail

Public Class registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim has As New OC.Core.Crypto.Hash
        If IsPostBack Then
            Randomize()
            Dim codigo As Integer = CLng(Rnd() * 9000000) + 1000000
            Dim bitDeControl = AccesoDatos.AccesoDatos.insertar(TextBox1.Text, TextBox2.Text, TextBox3.Text, codigo, RadioButtonList1.SelectedValue, has.MD5(TextBox4.Text).ToLower)
            If bitDeControl = 1 Then
                Dim envio As New EnvioEmail.EnvioEmail
                Dim to_address As New MailAddress(TextBox1.Text)
                envio.enviar(to_address, codigo)
                Response.Redirect("inicio.aspx")
                Label8.Text = "Te has registrado correctamente revisa tu correo para confirmar!"
                Label8.Visible = True
            Else
                Label8.Text = "Error al registrarte intentalo de nuevo!"
                Label8.ForeColor = Drawing.Color.Red
                Label8.Visible = True
            End If
        End If


    End Sub


End Class