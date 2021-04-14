Imports System.Web.SessionState
Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la aplicación

        Application.Contents("Logueados") = New AccesoDatos.AccesoDatos
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al iniciar la sesión
        Application.Lock()
        If Session("tipoUsuario") = "alumno" Then
            Dim x = CType(Application.Contents("Logueados"), AccesoDatos.AccesoDatos)
            x.agregarAlumnoLoguedo(Session("emailUsuario"))
            Application.Contents("Logueados") = x

        ElseIf Session("tipoUsuario") = "profesor" Or Session("tipoUsuario") = "vadillo" Then
            Dim x = CType(Application.Contents("Logueados"), AccesoDatos.AccesoDatos)
            x.agregarProfesorLoguedo(Session("emailUsuario"))
            Application.Contents("Logueados") = x
        End If

        Application.UnLock()
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al comienzo de cada solicitud
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena al intentar autenticar el uso
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando se produce un error
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la sesión
        Application.Lock()
        If Session("tipoUsuario") = "alumno" Then
            Dim x = CType(Application.Contents("Logueados"), AccesoDatos.AccesoDatos)
            x.borrarAlumnoLoguedo(Session("emailUsuario"))
            Application.Contents("Logueados") = x

        ElseIf Session("tipoUsuario") = "profesor" Or Session("tipoUsuario") = "vadillo" Then
            Dim x = CType(Application.Contents("Logueados"), AccesoDatos.AccesoDatos)
            x.borrarprofesorLoguedo(Session("emailUsuario"))
            Application.Contents("Logueados") = x
        End If
        Application.UnLock()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Se desencadena cuando finaliza la aplicación
    End Sub

End Class