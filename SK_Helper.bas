Type=Class
Version=5.82
ModulesStructureVersion=1
B4J=true
@EndOfDesignText@
#IgnoreWarnings: 9,12

'Class module
Sub Class_Globals
	Private pContent As StringBuilder
End Sub

Public Sub Initialize
	pContent.Initialize
End Sub

Public Sub HTMLList(Items As List, Ordered As Boolean) As String	
	pContent.Initialize
	
	If Ordered Then
		pContent.Append("<ol>")
	Else
		pContent.Append("<ul>")
	End If
	
	Dim i As Int
	
	For i = 0 To Items.Size-1
		pContent.Append("<li>" & Items.Get(i) & "</li>")
	Next	
	
	If Ordered Then
		pContent.Append("</ol>")
	Else
		pContent.Append("</ul>")
	End If
	
	Return pContent.ToString
End Sub

Public Sub HTMLInputList(Items As List, Id As String, Selected As String, IncludeBlank As Boolean) As String
	pContent.Initialize
	
	Dim i As Int
	
	pContent.Append("<select class=""u-full-width"" Id=""" & Id & """>")
	
	If IncludeBlank = True Then pContent.Append("<option value="" ""> </option>")
	
	For i = 0 To Items.Size-1
		pContent.Append("<option value=""" & Items.Get(i) & """")
		If Items.Get(i) = Selected Then pContent.Append(" selected")
		pContent.Append(">" & Items.Get(i) & "</option>")
	Next
	
	pContent.Append("</select>")
	
	Return pContent.ToString
End Sub

Public Sub HTMLButton(Text As String, Primary As Boolean, OnClick As String) As String
	pContent.Initialize		
	pContent.Append("<button")
	If Primary Then pContent.Append(" class=""button-primary""")
	If OnClick <> "" Then pContent.Append(" onclick=""" & OnClick & """")
	pContent.Append(">" & Text & "</button>")
	Return pContent.ToString
End Sub

Public Sub HTMLNBSP() As String
	Return "&nbsp;"
End Sub

Public Sub HTMLBreak() As String
	Return "</br>"	
End Sub

Public Sub HTMLContent(Text As String) As String
	Return "<p>" & Text & "</p>"
End Sub

Public Sub HTMLAnchor(Name As String) As String
	Return "<a name=""" & Name & """></a>"
End Sub

'AlertType: success, info, warning, error
Public Sub HTMLAlert(Title As String, Message As String, AlertType As String) As String
	Return $"<p class="alert alert-${AlertType.ToLowerCase}"><strong>${Title}</strong> ${Message}</p>"$
End Sub

Public Sub HTMLHeader(Level As Int, Text As String) As String
	Return "<h" & Level & ">" & Text & "</h" & Level & ">"
End Sub

Public Sub HTMLAnchorButton(Text As String, Primary As Boolean, href As String) As String
	pContent.Initialize
		
	pContent.Append("<a class=""button")
	If Primary Then pContent.Append(" button-primary")	
	pContent.Append(""" href=""" & href & """")
	pContent.Append(">" & Text & "</a>")
	
	Return pContent.ToString
End Sub

Public Sub HTMLInputButton(Text As String, Primary As Boolean, Submit As Boolean, Id As String) As String
	pContent.Initialize

	pContent.Append("<input ")
	
	If Primary Then pContent.Append("class=""button-primary"" ")
	
	If Submit Then
		pContent.Append("Type=""submit"" ")
	Else	
		pContent.Append("Type=""button"" ")
	End If
	
	If Id <> "" Then
		pContent.Append($"id="${Id}" name="${Id}""$)
	End If	
	
	pContent.Append("value=""" & Text & """>")
	
	Return pContent.ToString	
End Sub

Public Sub HTMLCode(Text As String) As String
	Return "<pre><code>" & Text & "</code></pre>"	
End Sub

Public Sub HTMLInputCheckbox(Checked As Boolean, Id As String) As String
	pContent.Initialize
	pContent.Append($"<input Type="checkbox" id="${Id}" name="${Id}""$)	
	If Checked = True Then pContent.Append(" checked")	
	pContent.Append(">")	
	Return pContent.ToString
End Sub

Public Sub HTMLInputHidden(Id As String, Value As String) As String
	Return "<input type=""hidden"" value=""" & Value & """ id=""" & Id & """ name=""" & Id & """>"
End Sub

Public Sub HTMLInputText(PlaceHolderText As String, Id As String, InputType As String, InitialValue As String) As String
	Return "<input class=""u-full-width"" Type=""" & InputType & """ placeholder=""" & PlaceHolderText & """ id=""" & Id & """ name=""" & Id & """ value=""" & InitialValue & """>"
End Sub

Public Sub HTMLInputTextArea(PlaceHolderText As String, Id As String, InputType As String, InitialValue As String) As String
	Return "<textarea class=""u-full-width"" Type=""" & InputType & """ placeholder=""" & PlaceHolderText & """ id=""" & Id & """ name=""" & Id & """ value=""" & InitialValue & """></textarea>"
End Sub

Public Sub HTMLLabel(Text As String, Element As String) As String	
	Return "<label For=""" & Element & """>" & Text & "</label>"
End Sub

Public Sub HTMLNamedDiv(Name As String) As String
	Return "<div id=""" & Name & """></div>"
End Sub

Public Sub HTMLNamedDivWithContent(Name As String, Style As String, Text As String) As String
	pContent.Initialize

	pContent.Append("<div ")
	If Name <> "" Then pContent.Append("id=""" & Name & """ ")
	If Style <> "" Then pContent.Append("style=""" & Style & """ ")
	pContent.Append(">")
	
	If Text <> "" Then pContent.Append(Text)
	
	pContent.Append("</div>")
	
	Return pContent.ToString
End Sub

Public Sub HTMLLink(Text As String, Link As String) As String
	Return "<a href=""" & Link & """>" & Text & "</a>"
End Sub

Public Sub HTMLImage(Src As String, Width As String, Height As String, Alt As String, Link As String) As String
	pContent.Initialize
	
	If Link <> "" Then pContent.Append($"<a href="${Link}">"$)
	
	pContent.Append($"<img src="${Src}""$)
	
	If Width <> "" Then pContent.Append($" width="${Width}""$)
	If Height <> "" Then pContent.Append($" height="${Height}""$)
	If Alt <> "" Then pContent.Append($" alt="${Alt}""$)
	
	pContent.Append(">")
	
	If Link <> "" Then pContent.Append("</a>")
	
	Return pContent.ToString
End Sub



Public Sub HTMLFormStart(Name As String, Action As String, Method As String, OnSubmit As String) As String
	pContent.Initialize

	pContent.Append("<form ")
	
	If Name <> "" Then pContent.Append("name=""" & Name & """ ")
	If Action <> "" Then pContent.Append("action=""" & Action & """ ")
	If Method <> "" Then pContent.Append("method=""" & Method & """ ")
	If OnSubmit <> "" Then pContent.Append("onsubmit=""" & OnSubmit & """ ")
	
	pContent.Append(">")
	
	Return pContent.ToString
End Sub

Public Sub HTMLFormEnd() As String
	Return "</form>"
End Sub

Public Sub HTMLTable(Table As SK_Table) As String
	pContent.Initialize
	pContent.Append("<table class=""u-full-width"">")
	
	'Header
	pContent.Append("<thead>")
	pContent.Append("<tr>")
	
	For Each HeaderText As String In Table.Header
    	pContent.Append("<th>" & HeaderText & "</th>")
	Next
	
	pContent.Append("</tr>")
	pContent.Append("</thead>")
	
	pContent.Append("<tbody>")
	
	'Rows	
	For Each Row As List In Table.Rows
		pContent.Append("<tr>")
		For Each RowText As String In Row		
    		pContent.Append("<td>" & RowText & "</td>")
		Next
		pContent.Append("</tr>")
	Next	

	pContent.Append("</tbody>")
	pContent.Append("</table>")
	
	Return pContent.ToString
End Sub

Public Sub HTMLFontAwesome(Name As String, Size As Int, FixedWidth As Boolean, Colour As String) As String
	pContent.Initialize
	
	pContent.Append("<i class=""fa ")
	pContent.Append(Name)	
	
	If Size <> 0 Then
		Select Size
			Case 2
				pContent.Append(" fa-2x")
			Case 3
				pContent.Append(" fa-3x")
			Case 4
				pContent.Append(" fa-4x")
			Case 5
				pContent.Append(" fa-5x")
			Case Else
				pContent.Append(" fa-lg")
		End Select
	End If
	
	If FixedWidth = True Then pContent.Append(" fa-fw") 
	If Colour <> "" Then pContent.Append(""" style=""color:" & Colour & ";")
	
	pContent.Append("""></i>")
	
	Return pContent.ToString
End Sub

Public Sub HTMLFontAwesomeAnimated(Name As String, Size As Int, FixedWidth As Boolean, Colour As String, Spin As Boolean, Pulse As Boolean) As String
	pContent.Initialize
	
	pContent.Append("<i class=""fa ")
	pContent.Append(Name)	
	
	If Spin = True Then pContent.Append("  fa-spin")
	If Pulse = True Then pContent.Append("  fa-pulse")
	
	If Size <> 0 Then
		Select Size
			Case 2
				pContent.Append(" fa-2x")
			Case 3
				pContent.Append(" fa-3x")
			Case 4
				pContent.Append(" fa-4x")
			Case 5
				pContent.Append(" fa-5x")
			Case Else
				pContent.Append(" fa-lg")
		End Select
	End If
	
	If FixedWidth = True Then pContent.Append(" fa-fw") 
	If Colour <> "" Then pContent.Append(""" style=""color:" & Colour & ";")
	
	pContent.Append("""></i>")
	
	Return pContent.ToString	
End Sub

Public Sub SK_TableReplaceColumnValue(Table As SK_Table, Column As Int, Find As String, Replace As String, Contains As Boolean) As SK_Table
	Dim i As Int
	
	For i = 0 To Table.Rows.Size-1
		Dim Row As List = Table.Rows.Get(i)
		Dim Old As String = Row.Get(Column)
		
		If Contains = False Then
			If Old = Find Then
				Row.Set(Column,Replace)
				Table.Rows.Set(i,Row)		
			End If
		Else
			If Old.Contains(Find) Then				
				Row.Set(Column,Old.Replace(Find,Replace))
				Table.Rows.Set(i,Row)	
			End If
		End If
	Next
	
	Return Table
End Sub

Public Sub SK_TablePrefixColumnValue(Table As SK_Table, Column As Int, Prefix As String) As SK_Table
	Dim i As Int
	
	For i = 0 To Table.Rows.Size-1
		Dim Row As List = Table.Rows.Get(i)
				
		Row.Set(Column,Prefix & Row.Get(Column))
		Table.Rows.Set(i,Row)		
	Next
	
	Return Table
End Sub

Public Sub SK_TableSuffixColumnValue(Table As SK_Table, Column As Int, Suffix As String) As SK_Table
	Dim i As Int
	
	For i = 0 To Table.Rows.Size-1
		Dim Row As List = Table.Rows.Get(i)
				
		Row.Set(Column,Row.Get(Column) & Suffix)
		Table.Rows.Set(i,Row)		
	Next
	
	Return Table
End Sub

Public Sub SK_TableColumnValueToHref(Table As SK_Table, Column As Int, Text As String, Target As String) As SK_Table
	Dim i As Int
	
	For i = 0 To Table.Rows.Size-1
		Dim Row As List = Table.Rows.Get(i)
		
		If Target = "" Then
			Row.Set(Column, "<a href=""" & Row.Get(Column) & """>" & Text & "</a>")
		Else
			Row.Set(Column, "<a href=""" & Row.Get(Column) & """ target=""" & Target & """>" & Text & "</a>")
		End If
		
		Table.Rows.Set(i,Row)		
	Next
	
	Return Table
End Sub