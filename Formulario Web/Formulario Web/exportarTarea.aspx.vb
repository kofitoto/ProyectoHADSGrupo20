Imports System.Data.SqlClient



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
        If GridView1.Rows.Count < 0 Then
            Label2.Text = "No hay nada que exportar"
            Label2.ForeColor = Drawing.Color.Red
            Label2.Visible = True
        Else
            Dim lugarDeGuardado As String = Server.MapPath("./App_Data/" + dropAsigP.SelectedValue + ".xml")
            Dim dV As New DataView
            Dim dT As New DataTable
            dV = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
            dT = dV.ToTable
            dT.Namespace = "http://ji.ehu.es/" + dropAsigP.SelectedValue
            dT.TableName = "tarea"
            dT.Columns(0).ColumnMapping = MappingType.Attribute
            dT.WriteXml(lugarDeGuardado)
            'Response.ContentType = "text/xml"
            'Response.ContentEncoding = System.Text.Encoding.UTF8
            'Response.AppendHeader("NombreCabecera", "MensajeCabecera")
            'Response.TransmitFile(Server.MapPath("~/tuRuta/TuArchivo.xml"))
            'Response.End()

            Label2.Text = "Documento exportado correctamente!"
            Label2.ForeColor = Drawing.Color.Green
            Label2.Visible = True
        End If

    End Sub
End Class