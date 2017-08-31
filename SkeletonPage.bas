Type=Class
Version=5.82
ModulesStructureVersion=1
B4J=true
@EndOfDesignText@
#IgnoreWarnings: 9,12

'Class module
Sub Class_Globals
	Type SK_Page(Containers As List, HeaderScripts As List, BodyScripts As List, Metas As List)
	
	Type SK_Row(Columns As List)
	Type SK_Table(Header As List, Rows As List)
	
	Private pTitle As String = "Title"
	Private pAuthor As String = ""
	Private pDescription As String = ""
	
	Private SkeletonPageObject As SK_Page
	
	Private pIncludeCSSSkeleton As Boolean = True
	'Private pIncludeCSSSkeletonAlerts As Boolean = True
	Private pIncludeCSSSkeletonExtensions As Boolean = True
	Private pIncludeCSSNormalize As Boolean = True
	Private pIncludeCSSFontawesome As Boolean = True
	Private pIncludeCSSFontRaleway As Boolean = True
	
	Private Close_Div As String = "</div>" & CRLF
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	SkeletonPageObject.Initialize
	SkeletonPageObject.Containers.Initialize
	SkeletonPageObject.Containers.Clear
	
	SkeletonPageObject.HeaderScripts.Initialize
	SkeletonPageObject.HeaderScripts.Clear
	
	SkeletonPageObject.BodyScripts.Initialize
	SkeletonPageObject.BodyScripts.Clear
	
	SkeletonPageObject.Metas.Initialize
	SkeletonPageObject.Metas.Clear
End Sub

#Region getters & setters
'Get the page title
public Sub getTitle As String
	Return pTitle
End Sub

'Set the page title
Public Sub setTitle(Title As String)
	pTitle = Title
End Sub

'Get the page author
public Sub getAuthor As String
	Return pAuthor
End Sub

'Set the page author
Public Sub setAuthor(Author As String)
	pAuthor = Author
End Sub

'Get the page description
public Sub getDescription As String
	Return pDescription
End Sub

'Set the page description
Public Sub setDescription(Description As String)
	pDescription = Description
End Sub
#End Region getters & setters

#Region CSS

'Include Skeleton CSS?
Public Sub setIncludeCSSSkeleton(Include As Boolean)
	pIncludeCSSSkeleton = Include
End Sub

'Include Skeleton Alerts CSS?
'Public Sub setIncludeCSSSkeletonAlerts(Include As Boolean)
'	pIncludeCSSSkeletonAlerts = Include
'End Sub

'Include Normalize CSS?
Public Sub setIncludeCSSNormalize(Include As Boolean)
	pIncludeCSSNormalize = Include
End Sub

'Include Fontawesome CSS?
Public Sub setIncludeCSSFontawesome(Include As Boolean)
	pIncludeCSSFontawesome = Include
End Sub

'Include Raleway Font CSS?
Public Sub setIncludeCSSFontRaleway(Include As Boolean)
	pIncludeCSSFontRaleway = Include
End Sub

'Include Skeleton Extensions CSS?
Public Sub setIncludeCSSSkeletonExtensions(Include As Boolean)
	pIncludeCSSSkeletonExtensions = Include
End Sub

#End Region

'Add a script
'AddToHeader = True means script added to start of page
'AddToHeader = False means script is added to end of page
Public Sub AddScript(Script As String, AddToHeader As Boolean) 'ignore
	If AddToHeader = False Then
		SkeletonPageObject.BodyScripts.Add(Script)
	Else
		SkeletonPageObject.HeaderScripts.Add(Script)
	End If	
End Sub

'Add extra HTML meta to the page
Sub AddMeta(Meta As String) 'ignore
	SkeletonPageObject.Metas.Add(Meta)
End Sub

'Add a Skeleton Container
Sub AddContainer(Container As SK_Container) 'ignore
	SkeletonPageObject.Containers.Add(Container)
End Sub

'Render
Sub Render As String 'ignore
	Dim sb As StringBuilder	
	sb.Initialize
	
	sb.Append(Begin_Body)
	
	'Process containers
	For Each Container As SK_Container In SkeletonPageObject.Containers
		sb.Append(Container.Render)	
	Next	
	
	sb.Append(End_Body)
	
	Return sb.ToString	
End Sub

Private Sub Begin_Body As String
	Dim sb As StringBuilder	
	sb.Initialize
	
	sb.Append("<!DOCTYPE html>")
	sb.Append("<html lang=""en"">")
	sb.Append("<head>")
	sb.Append("<!-- Basic Page Needs -->").Append(CRLF)
	sb.Append("<meta charset=""utf-8"">").Append(CRLF)
	sb.Append("<title>" & pTitle & "</title>").Append(CRLF)
	
	sb.Append($"<meta name="description" content="${pDescription}">${CRLF}"$)
	sb.Append($"<meta name="author" content="${pAuthor}">${CRLF}"$)

	sb.Append("<!-- Mobile Specific Metas -->").Append(CRLF)
	sb.Append("<meta name=""viewport"" content=""width=device-width, initial-scale=1"">").Append(CRLF)

	sb.Append("<!-- FONT -->").Append(CRLF)
	If pIncludeCSSFontRaleway = True Then sb.Append("<link href=""//fonts.googleapis.com/css?family=Raleway:400,300,600"" rel=""stylesheet"" type=""text/css"">").Append(CRLF)
	If pIncludeCSSFontawesome = True Then sb.Append("<link href=""/css/font-awesome.min.css"" rel=""stylesheet"" type=""text/css"">").Append(CRLF)

	sb.Append("<!-- CSS -->").Append(CRLF)
	If pIncludeCSSNormalize = True Then sb.Append("<link rel=""stylesheet"" href=""/css/normalize.css"" type=""text/css"">").Append(CRLF)
	If pIncludeCSSSkeleton = True Then sb.Append("<link rel=""stylesheet"" href=""/css/skeleton.css"" type=""text/css"">").Append(CRLF)
	'If pIncludeCSSSkeletonAlerts = True Then sb.Append("<link rel=""stylesheet"" href=""/css/skeleton-alerts.css"" type=""text/css"">").Append(CRLF)
	If pIncludeCSSSkeletonExtensions = True Then sb.Append("<link rel=""stylesheet"" href=""/css/skeleton-extensions.css"" type=""text/css"">").Append(CRLF)
		
	'sb.Append("<!-- Favicon -->").Append(CRLF)
	'sb.Append("<link rel=""icon"" type=""image/png"" href=""/images/favicon.png"">").Append(CRLF)
	
	For Each Meta As String In SkeletonPageObject.Metas
		sb.Append(Meta).Append(CRLF)
	Next
	
	For Each Script As String In SkeletonPageObject.HeaderScripts
		sb.Append(Script).Append(CRLF)
	Next

	sb.Append("</head>").Append(CRLF)
	sb.Append("<body>").Append(CRLF)
	
	Return sb.ToString
End Sub

Private Sub End_Body As String
	Dim sb As StringBuilder	
	sb.Initialize
	
	For Each Script As String In SkeletonPageObject.BodyScripts
		sb.Append(Script).Append(CRLF)
	Next
	
	sb.Append("<!-- End Document -->").Append(CRLF)
	sb.Append("</body>").Append(CRLF)
	sb.Append("</html>").Append(CRLF)

	Return sb.ToString
End Sub