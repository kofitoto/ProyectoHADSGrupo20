Imports System.Net.Mail

Public Class cambiarpassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox2.Visible = True
        TextBox3.Visible = True
        Label2.Visible = True
        Label3.Visible = True
        Button2.Visible = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If IsPostBack Then
            Randomize()
            Dim codigo As Integer = CLng(Rnd() * 9000000) + 1000000
            Dim val = AccesoDatos.AccesoDatos.cambiarPassword(TextBox1.Text, codigo)
            If val = 1 Then
                Dim envio As New EnvioEmail.EnvioEmail
                Dim to_address As New MailAddress(TextBox1.Text)
                envio.emailRecuperacion(to_address, codigo)

                Label4.Text = "Revisa el buzon de tu correo para continuar con el cambio de contraseña!"
                Label4.ForeColor = Drawing.Color.Green
                Label4.Visible = True
                'MsgBox("Revisa el buzon de tu correo para continuar con el cambio de contraseña!")

            Else
                Label4.Text = "Error: Revise si el correo introducido es con el que se registró"
                Label4.ForeColor = Drawing.Color.Red
                Label4.Visible = True
                'MsgBox("Error: Revise si el correo introducido es con el que se registró")

            End If

        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim has As New OC.Core.Crypto.Hash
        If IsPostBack Then
            Dim Mail = Request.QueryString("mail")
            Dim codigo = Convert.ToInt32(Request.QueryString("codigo"))

            Dim val = AccesoDatos.AccesoDatos.confirmarCambio(has.MD5(TextBox2.Text).ToLower, Mail, codigo)
            If val = 1 Then
                Label4.Text = "Has cambiado de contraseña correctamente! Ya puedes volver a loguearte!"
                Label4.ForeColor = Drawing.Color.Green
                Label4.Visible = True
                'MsgBox("Has cambiado de contraseña correctamente!")
            Else
                Label4.Text = "Upss algo ha salido mal intenta recuperar la contraseña"
                Label4.ForeColor = Drawing.Color.Red
                Label4.Visible = True
                'MsgBox("Upss algo ha salido mal intenta recuperar la contraseña")
            End If
        End If
    End Sub
End Class