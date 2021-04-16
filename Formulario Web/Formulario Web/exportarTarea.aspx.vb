Imports System.Data.SqlClient
Imports System.Xml



Public Class exportarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            IniciarLlenadoAsig()
        End If
    End Sub

    Protected Sub IniciarLlenadoAsig()

        Dim emailUsuario As String = Session("emailUsuario")
        Dim asignaturas As SqlCommand

        Dim v As New AccesoDatos.AccesoDatos()

        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        asignaturas = AccesoDatos.AccesoDatos.llenarProfesor(emailUsuario)

        da = New SqlDataAdapter(asignaturas)
        da.Fill(ds)

        dropAsigP.DataSource = ds 'LLenamos el dropList de la interfaz
        dropAsigP.DataBind()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If GridView1.Rows.Count = 0 Then
            Label2.Text = "No hay nada que exportar"
            Label2.ForeColor = Drawing.Color.Red
            Label2.Visible = True
        Else
            Dim ds As New DataSet
            Dim da As New SqlDataAdapter


            Dim conec As New SqlConnection("")
            da = New SqlDataAdapter($"select * from {GridView1}", conec)
            da.Fill(ds)
                Dim lugarDeGuardado As String = Server.MapPath("./App_Data/" + dropAsigP.SelectedValue + ".xml")
                'AccesoDatos.AccesoDatos.exportarTareaXML(GridView1, lugarDeGuardado)
                ds.WriteXml(lugarDeGuardado)
                Label2.Visible = True
        End If

    End Sub


    'Dim xmld As New XmlDocument
    'Dim xt As XmlText
    'Dim elementoTareas As XmlElement = xmld.CreateElement("tareas")
    'xmld.AppendChild(elementoTareas)
    'For Each t As GridViewRow In tareas
    '    Dim elementoTarea As XmlElement = xmld.CreateElement("tarea")
    '    For Each columna As TableCell In t.Cells
    '        Dim nombreColumna = columna.ToString
    '        Dim camp As XmlElement = xmld.CreateElement(nombreColumna)
    '        If nombreColumna = "codigo" Then
    '            Dim at As XmlAttribute = xmld.CreateAttribute(nombreColumna)
    '            xt = xmld.CreateTextNode(columna.Text)
    '            at.AppendChild(xt)
    '            elementoTarea.Attributes.Append(at)
    '        ElseIf nombreColumna = "descripcion" Then
    '            xt = xmld.CreateTextNode(columna.Text)
    '            camp.AppendChild(xt)
    '            elementoTarea.AppendChild(camp)
    '        ElseIf nombreColumna = "hestimadas" Then
    '            xt = xmld.CreateTextNode(columna.Text)
    '            camp.AppendChild(xt)
    '            elementoTarea.AppendChild(camp)
    '        ElseIf nombreColumna = "explotacion" Then
    '            xt = xmld.CreateTextNode(columna.Text)
    '            camp.AppendChild(xt)
    '            elementoTarea.AppendChild(camp)
    '        ElseIf nombreColumna = "tipotarea" Then
    '            xt = xmld.CreateTextNode(columna.Text)
    '            camp.AppendChild(xt)
    '            elementoTarea.AppendChild(camp)
    '        End If
    '    Next
    '    xmld.DocumentElement.AppendChild(elementoTarea)
    'Next
    'xmld.Save(lugarDeGuardado)

End Class
