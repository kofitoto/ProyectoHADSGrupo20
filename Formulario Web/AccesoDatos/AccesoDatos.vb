Imports System.Data.SqlClient
Imports System.Web.UI.WebControls

Public Class AccesoDatos
    Private Shared comando As New SqlCommand
    Private Shared conexion As New SqlConnection
    Private Shared profesores As New ArrayList
    Private Shared profesoresContador As New Integer
    Private Shared alumnos As New ArrayList
    Private Shared alumnosContador As New Integer

    Public Shared Function insertar(ByVal email As String, ByVal nombre As String, ByVal apellido As String, ByVal numconfir As Integer, ByVal tipo As String, ByVal pass As String) As Integer
        Dim confirmado As Integer = 0
        Dim done As Integer
        Dim sql = "insert into Usuarios values ('" & email & "','" & nombre & "','" & apellido & "'," & numconfir & "," & confirmado & ",'" & tipo & "','" & pass & "',0)"
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function

    Public Shared Function conectar() As String
        Try
            conexion.ConnectionString = "Server=tcp:hads21-20.database.windows.net,1433;Initial Catalog=HADS21-20;Persist Security Info=False;User ID=kd-darko@hotmail.com@hads21-20;Password=Leiringrado20;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub

    Public Shared Function confirmar(ByVal mail As String, ByVal codigo As Int32) As Integer
        Dim done As Integer
        Dim sql = $"update Usuarios set numconfir = 0, confirmado = 1 where email = '{mail}' and confirmado = 0 and numconfir = {codigo} "
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function
    Public Shared Sub exportarTareaXML(ByVal tabla As GridView, ByVal lugarDeGuardado As String)
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        Try
            Dim conec As New SqlConnection("Server=tcp:hads21-20.database.windows.net,1433;Initial Catalog=HADS21-20;Persist Security Info=False;User ID=kd-darko@hotmail.com@hads21-20;Password=Leiringrado20;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")
            da = New SqlDataAdapter($"select * from {tabla}", conec)

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        da.Fill(ds)
        ds.WriteXml(lugarDeGuardado)
    End Sub
    Public Shared Function cambiarPassword(ByVal mail As String, ByVal codigo As Integer) As Integer
        Dim done As Integer
        Dim sql = $"update Usuarios set numconfir = {codigo} where email = '{mail}' and confirmado = 1 and numconfir = 0 "
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function
    Public Shared Function verificarLogin(ByVal email As String, ByVal pass As String) As ArrayList
        Dim sql = $"select * from Usuarios where numconfir = 0 and confirmado = 1 and email = '{email}' and pass = '{pass}'"
        Dim done As SqlDataReader
        Dim result As New ArrayList
        conectar()
        Try
            comando = New SqlCommand(sql, conexion)
            done = comando.ExecuteReader()
            While done.Read
                result.Add(done("email"))
                result.Add(done("pass"))
                result.Add(done("tipo"))
            End While
            comando.ExecuteReader.Close()
        Catch ex As Exception

        End Try

        cerrarconexion()
        Return result




    End Function

    Public Shared Function confirmarCambio(ByVal pass As String, ByVal email As String, ByVal codigo As Integer) As Integer

        Dim sql = $"update Usuarios set pass = '{pass}', numconfir = 0 where email = '{email}' and confirmado = 1 and numconfir = '{codigo}' "
        Dim done As Integer
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function

    Public Shared Function llenarProfesor(ByVal mail As String)
        Dim sql = $"Select GruposClase.codigoasig FROM ProfesoresGrupo, GruposClase Where (Email='{mail}' and GruposClase.codigo = ProfesoresGrupo.codigogrupo);"
        conectar()
        Dim command As New SqlCommand
        command = New SqlCommand(sql, conexion)

        conexion.Close()
        Return command


    End Function
    Public Shared Function TipoTarea()
        Dim sql = $"Select distinct TipoTarea FROM TareasGenericas;"
        conectar()
        Dim command As New SqlCommand
        command = New SqlCommand(sql, conexion)

        conexion.Close()
        Return command


    End Function

    Public Shared Function Asignaturas()
        Dim sql = $"Select distinct codigo FROM Asignaturas;"
        conectar()
        Dim command As New SqlCommand
        command = New SqlCommand(sql, conexion)

        conexion.Close()
        Return command


    End Function

    Public Shared Function insertarTarea(ByVal codigo As String, ByVal descripcion As String, ByVal codigoAsig As String, ByVal hEstimadas As Integer, ByVal tipoTarea As String) As Integer
        Dim confirmado As Integer = 0
        Dim done As Integer
        Dim sql = "insert into TareasGenericas values ('" & codigo & "','" & descripcion & "','" & codigoAsig & "'," & hEstimadas & ",0,'" & tipoTarea & "')"
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function

    Public Shared Function insertarTareaXML(ByVal codigo As String, ByVal descripcion As String, ByVal codigoAsig As String, ByVal hEstimadas As Integer, ByVal explotacion As Boolean, ByVal tipoTarea As String) As Integer
        Dim done As Integer
        Dim sql = "insert into TareasGenericas values ('" & codigo & "','" & descripcion & "','" & codigoAsig & "'," & hEstimadas & ",'" & explotacion & "','" & tipoTarea & "')"
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function
    Public Shared Function existeTareaXML(ByVal cod As String) As Integer
        Dim done As Integer
        Dim sql = $"Select count(*) from TareasGenericas where Codigo = '{cod}'"
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteScalar
        Catch ex As Exception
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function
    Public Shared Function llenarAlumno(ByVal mail As String)
        Dim sql = $"Select GruposClase.codigoasig FROM EstudiantesGrupo, GruposClase Where (Email='{mail}' and GruposClase.codigo = EstudiantesGrupo.Grupo)"
        conectar()
        Dim command As New SqlCommand
        command = New SqlCommand(sql, conexion)

        conexion.Close()
        Return command


    End Function


    Public Shared Function tareasAlumnos(ByVal asig As String, ByVal mail As String)
        Dim sql = $"SELECT tg.Codigo, tg.Descripcion, tg.HEstimadas, tg.TipoTarea FROM TareasGenericas tg Where CodAsig = '{asig}' except select tg.Codigo, tg.Descripcion, tg.HEstimadas, tg.TipoTarea from TareasGenericas tg inner join EstudiantesTareas et on tg.Codigo=et.CodTarea where CodAsig = '{asig}' and et.Email= '{mail}'"

        conectar()
        Dim command As New SqlCommand
        command = New SqlCommand(sql, conexion)

        conexion.Close()
        Return command

    End Function


    Public Shared Function tablaEntradaInstanciada(ByVal mail As String)
        Dim sql = $"select Email, CodTarea, HEstimadas, HReales from EstudiantesTareas where email = '{mail}'"
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        conectar()
        Dim command As New SqlCommand
        command = New SqlCommand(sql, conexion)
        da = New SqlDataAdapter(command)
        da.Fill(ds)
        conexion.Close()
        Return ds
    End Function

    Public Shared Function insertarTareaAlumno(ByVal email As String, ByVal codigo As String, ByVal hest As Integer, ByVal hreal As Integer) As Integer

        Dim sql = "insert into EstudiantesTareas values ('" & email & "','" & codigo & "','" & hest & "','" & hreal & "')"
        Dim done As Integer
        conectar()
        comando = New SqlCommand(sql, conexion)
        Try
            done = comando.ExecuteNonQuery
        Catch ex As Exception
            MsgBox("Error : Ya se ha instanciado esta tarea")
            Return -1
        End Try
        cerrarconexion()
        Return done
    End Function

    Public Sub agregarProfesorLoguedo(ByVal email As String)
        If Not profesores.Contains(email) Then
            profesores.Add(email)
            profesoresContador = profesores.Count
        End If
    End Sub

    Public Sub agregarAlumnoLoguedo(ByVal email As String)
        If Not alumnos.Contains(email) Then
            alumnos.Add(email)
            alumnosContador = alumnos.Count
        End If
    End Sub

    Public Function getsAlumnosLoguedo() As ArrayList
        Return alumnos
    End Function

    Public Function getprofesoresLoguedo() As ArrayList
        Return profesores
    End Function

    Public Function getNumProfesores() As Integer
        Return profesores.Count
    End Function

    Public Function getNumAlumnos() As Integer
        Return alumnos.Count
    End Function

    Public Sub borrarAlumnoLoguedo(ByVal email As String)
        If alumnos.Contains(email) Then
            alumnos.Remove(email)
            alumnosContador = alumnos.Count
        End If
    End Sub

    Public Sub borrarprofesorLoguedo(ByVal email As String)
        If profesores.Contains(email) Then
            profesores.Remove(email)
            profesoresContador = profesores.Count
        End If
    End Sub
End Class
