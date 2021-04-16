Imports System.Net.Mail
Imports System.Security.Policy


Public Class EnvioEmail
    Public Function enviar(to_address As MailAddress, numConfirmacion As Integer) As Boolean
        Try
            Dim from_address As New MailAddress("kdarko001@ikasle.ehu.eus")
            'Dim smtp As New SmtpClient
            Dim smtpehu As New SmtpClient
            'smtp.Host = "smtp.gmail.com"
            smtpehu.Host = "smtp.ehu.eus"
            'smtp.Port = 587
            smtpehu.Port = 587
            'smtp.EnableSsl = True
            smtpehu.EnableSsl = True
            'smtp.UseDefaultCredentials = False
            smtpehu.UseDefaultCredentials = False
            smtpehu.Credentials = New System.Net.NetworkCredential(from_address.Address, "692708916-Kk")
            Dim mensaje As New MailMessage(from_address, to_address)
            mensaje.Subject = " email de Kofi-macion"
            Dim url = $"https://localhost:44376/confirmar.aspx?mail={to_address}&codigo={numConfirmacion}"
            mensaje.Body = $"<html><head></head><body>" + "Para validar el registro pulse el siguiente enlace:" + url + "<br>" + "</body></html>"
            mensaje.IsBodyHtml = True
            smtpehu.Send(mensaje)
        Catch e As Exception
            Return False
        End Try
        Return True
    End Function

    Public Function emailRecuperacion(to_address As MailAddress, numConfirmacion As Integer) As Boolean
        Try
            Dim from_address As New MailAddress("kdarko001@ikasle.ehu.eus")
            'Dim smtp As New SmtpClient
            Dim smtpehu As New SmtpClient
            'smtp.Host = "smtp.gmail.com"
            smtpehu.Host = "smtp.ehu.eus"
            'smtp.Port = 587
            smtpehu.Port = 587
            'smtp.EnableSsl = True
            smtpehu.EnableSsl = True
            'smtp.UseDefaultCredentials = False
            smtpehu.UseDefaultCredentials = False
            smtpehu.Credentials = New System.Net.NetworkCredential(from_address.Address, "692708916-Kk")
            Dim mensaje As New MailMessage(from_address, to_address)
            mensaje.Subject = " email de Kofi-macion"
            Dim url = $"https://localhost:44376/cambiarpassword.aspx?mail={to_address}&codigo={numConfirmacion}"
            mensaje.Body = $"<html><head></head><body>" + "Para recuperar tu contrasena pulse el siguiente enlace:" + url + "<br>" + "</body></html>"
            mensaje.IsBodyHtml = True
            smtpehu.Send(mensaje)
        Catch e As Exception
            Return False
        End Try
        Return True
    End Function

End Class
