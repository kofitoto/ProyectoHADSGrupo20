Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("registro.aspx")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("cambiarpassword.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim has As New OC.Core.Crypto.Hash
        Dim contraEncriptado = has.MD5(TextBox3.Text).ToLower
        Dim val = AccesoDatos.AccesoDatos.verificarLogin(TextBox2.Text, contraEncriptado)
        Dim x As AccesoDatos.AccesoDatos = Application.Contents("Logueados")
        Try
            If val(0) = TextBox2.Text And val(1).Equals(contraEncriptado) Then
                'MsgBox("Te has logueado correctamente!")
                Label3.Text = "Te has logueado correctamente!"
                Label3.Visible = True
                Session.Add("emailUsuario", TextBox2.Text)
                Session.Add("tipoUsuario", val(2))


                If TextBox2.Text = "vadillo@ehu.es" Then
                    FormsAuthentication.RedirectFromLoginPage("vadillo", False)
                Else
                    FormsAuthentication.RedirectFromLoginPage(val(2).ToString.ToLower, False)
                End If

                If Request.QueryString.Get("ReturnUrl") = Nothing Then

                    If val(2) = "Alumno" Then
                        x.agregarAlumnoLoguedo(Session("emailUsuario"))
                        Application.Contents("Logueados") = x
                        Response.Redirect("alumno.aspx")
                    Else
                        x.agregarProfesorLoguedo(Session("emailUsuario"))
                        Application.Contents("Logueados") = x
                        Response.Redirect("profesor.aspx")
                    End If
                End If

            End If
        Catch ex As Exception
            'MsgBox("Ha habido un error, consulte si el correo y la contraseña son correctos")
            Label3.Text = "Ha habido un error, consulte si el correo y la contraseña son correctos"
            Label3.ForeColor = Drawing.Color.Red
            Label3.Visible = True
        End Try

    End Sub
End Class