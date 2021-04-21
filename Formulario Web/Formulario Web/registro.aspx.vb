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
                'Response.Redirect("inicio.aspx")
                Button1.Visible = True
                Label10.Text = "Te has registrado correctamente revisa tu correo para confirmar!"
                Label10.ForeColor = Drawing.Color.Green
                Label10.Visible = True
            Else
                Label10.Text = "Error al registrarte intentalo de nuevo!"
                Label10.ForeColor = Drawing.Color.Red
                Label10.Visible = True
            End If
        End If


    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim us As New es.ehusw.Matriculas

        If us.comprobar(TextBox1.Text) = "SI" Then
            Label9.Text = "Esta Matriculado!"
            Label9.ForeColor = Drawing.Color.Green
            Label9.Visible = True
            Button1.Visible = True
            Label10.Visible = False
        Else
            Button1.Visible = False
            Label10.Text = "No se podra registrar si no esta matriculado!"
            Label10.ForeColor = Drawing.Color.Red
            Label10.Visible = True
            Label9.Text = "No esta Matriculado"
            Label9.ForeColor = Drawing.Color.Red
            Label9.Visible = True
        End If
    End Sub
End Class