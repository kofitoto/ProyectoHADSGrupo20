Imports System.Data.SqlClient
Imports System.Xml
Public Class ImportarTareasXMLDocument
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            IniciarLlenadoAsig()
        End If
        cargarFicherosXML()
    End Sub

    Protected Sub IniciarLlenadoAsig()

        Dim emailUsuario As String = Session("emailUsuario")
            Dim asignaturas As SqlCommand

            Dim v As New AccesoDatos.AccesoDatos()

            Dim ds As New DataSet
            Dim da As New SqlDataAdapter

            asignaturas = AccesoDatos.AccesoDatos.llenarProfesor(emailUsuario)

        da = New SqlDataAdapter(asignaturas)
        da.Fill(ds) 'Llenamos el dataSet

        dropAsigP.DataSource = ds 'LLenamos el dropList de la interfaz
        dropAsigP.DataBind()
    End Sub

    Protected Sub cargarFicherosXML()
        Try

            Xml1.DocumentSource = Server.MapPath("./App_Data/" + dropAsigP.SelectedValue + ".xml")
            Xml1.TransformSource = Server.MapPath("./App_Data/VerTablaTareas.xsl")
        Catch ex As Exception
            Label2.Text = "No exite ningun fichero XML con ese codigo"
            Label2.ForeColor = Drawing.Color.Red
            Label2.Visible = True
            'MsgBox("No exite ningun fichero XML con ese codigo")
        End Try

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim xmld As New XmlDocument()
        xmld.Load(Server.MapPath("./App_Data/" + dropAsigP.SelectedValue + ".xml"))
        Dim tarea As XmlNodeList
        tarea = xmld.GetElementsByTagName("tarea")

        For Each t In tarea
            Dim codigo = t.Attributes("codigo").Value.ToString()
            If AccesoDatos.AccesoDatos.existeTareaXML(codigo) = 0 Then
                Dim descripcion = t.ChildNodes(0).InnerText.ToString()
                Dim codAsig = dropAsigP.SelectedValue
                Dim hEstimadas = Integer.Parse(t.ChildNodes(1).InnerText)
                Dim explotacion = Boolean.Parse(t.ChildNodes(2).InnerText)
                Dim tipoTarea = t.ChildNodes(3).InnerText.ToString()

                Dim val = AccesoDatos.AccesoDatos.insertarTareaXML(codigo, descripcion, codAsig, hEstimadas, explotacion, tipoTarea)
                If val = 1 Then
                    'MsgBox("Tarea con codigo" + codigo + " insertada correctamente!")
                    Label2.Text = "Tarea con codigo" + codigo + " insertada correctamente!"
                    Label2.ForeColor = Drawing.Color.Green
                    Label2.Visible = True
                End If
            Else
                Label2.Text = "La Tarea con codigo" + codigo + " ya existe en la BD"
                Label2.ForeColor = Drawing.Color.Red
                Label2.Visible = True
                'MsgBox("La Tarea con codigo" + codigo + " ya existe en la BD")
            End If
        Next
    End Sub
End Class