Type=Class
Version=5.82
ModulesStructureVersion=1
B4J=true
@EndOfDesignText@
'Class module
Private Sub Class_Globals
	Private pRows As List
	Private pColor As String
	Private pBackground As String
	Private pAlign As String
	Private pMarginTop As Int
	Private pPadding As Int
	
	Private Close_Div As String = "</div>" & CRLF
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	'Type SK_Container(Rows As List, Color As String, Background As String, Align As String) ', Properties As Map)
	pRows.Initialize
	pColor = ""
	pBackground = ""
	pAlign = ""
	pMarginTop = 0
	pPadding = 0
End Sub

'Set container text color
'Assumed to be a hex color string
Public Sub setColor(Color As String)
	pColor = Color
End Sub

Public Sub getColor() As String
	Return pColor
End Sub

'Background
'If background string cotains .jpg or .png then image is assumed
'Otherwise string is assumed to be a hex color string
Public Sub setBackground(Background As String)
	pBackground = Background
End Sub

Public Sub getBackground() As String
	Return pBackground
End Sub

'Set container alignment
'Align: left, right, center, justify
public Sub setAlign(Align As String)
	pAlign = Align
End Sub

Public Sub getAlign() As String
	Return pAlign
End Sub

'Set container top margin
'MarginTop: integer value in rem units
'rem = relative to font-size of the root element
Public Sub setMarginTop(MarginTop As Int)
	pMarginTop = MarginTop
End Sub

Public Sub getMarginTop() As Int
	Return pMarginTop
End Sub

'Set container padding
'Padding: integer value in rem units
'rem = relative to font-size of the root element
Public Sub setPadding(Padding As Int)
	pPadding = Padding
End Sub

Public Sub getPadding() As Int
	Return pPadding
End Sub

Public Sub Add(Row As Object)
	pRows.Add(Row)
End Sub

Public Sub Rows() As List
	Return pRows
End Sub

Public Sub Render As String
	Dim sb As StringBuilder
	sb.Initialize
	
	sb.Append(Begin_Section)
	sb.Append(Begin_Container)
		
	'Process row
	For Each Row As SK_Row In Rows
		sb.Append("<div class=""row"">" & CRLF)
			
		'Process column
		For Each Column As SK_Column In Row.Columns
			sb.Append(Column.Render)
		Next
			
		sb.Append(Close_Div)
	Next
		
	sb.Append(Close_Div)
	sb.Append(Close_Div)
	
	Return sb.ToString
End Sub

Private Sub Begin_Section() As String
	Dim pContent As StringBuilder
	pContent.Initialize
	
	pContent.Append($"<div class="section""$)
	
	If pAlign.Length > 0 Then pContent.Append($" align="${pAlign}""$)
	
	'Build the style
	Dim styles As List
	styles.Initialize
	
	If pMarginTop > 0 Then styles.Add($"margin-top:${pMarginTop}rem;"$)
	If pPadding > 0 Then styles.Add($"padding:${pPadding}rem;"$)
	If pColor.Length > 0 Then styles.Add($"color:${pColor};"$)
		
	If pBackground.Length > 0 Then
		If pBackground.ToLowerCase.Contains(".jpg") Or pBackground.ToLowerCase.Contains(".png") Then
			styles.Add("background-image:url(" & pBackground & ");background-size:cover;")
		Else
			styles.Add("background-color:" & pBackground & ";overflow:auto;")
		End If		
	End If
	
	If styles.Size>0 Then
		pContent.Append($" style=""$)
		For Each style As String In styles
			pContent.Append(style)
		Next
		pContent.Append($"""$)
	End If
	
	pContent.Append(">" & CRLF)
	Return pContent.ToString
End Sub

Private Sub Begin_Container() As String
	Dim pContent As StringBuilder
	pContent.Initialize
	pContent.Append($"<div class="container">"$)
	Return pContent.ToString
End Sub