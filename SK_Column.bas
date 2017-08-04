Type=Class
Version=5.82
ModulesStructureVersion=1
B4J=true
@EndOfDesignText@
#IgnoreWarnings: 9,12

'Class module
Private Sub Class_Globals
	Private pSize As Int
	Private pContent As List
	Private h As SK_Helper
End Sub

Public Sub Initialize(Size As Int)
	pSize = Size
	pContent.Initialize
	h.Initialize
End Sub

'Add normal conent (content body)
Public Sub AddContent(Text As String)
	pContent.Add(h.HTMLContent(Text))
	AddCRLF
End Sub

'Add a non-breaking space (NBSP)
Public Sub AddNBSP()
	pContent.Add(h.HTMLNBSP)
End Sub

'Add a hard break
Public Sub AddBreak()
	pContent.Add(h.HTMLBreak)
	AddCRLF
End Sub

'Add an anchor element
Public Sub AddAnchor(Name As String)
	pContent.Add(h.HTMLAnchor(Name))
	AddCRLF
End Sub

'Add a header element
Public Sub AddHeader(Level As Int, Text As String)
	pContent.Add(h.HTMLHeader(Level,Text))
	AddCRLF
End Sub

'Add a normal button element
Public Sub AddButton(Text As String, Primary As Boolean, OnClick As String)
	pContent.Add(h.HTMLButton(Text,Primary,OnClick))
	AddCRLF
End Sub

'Add an anchor button element
Public Sub AddAnchorButton(Text As String, Primary As Boolean, href As String)
	pContent.Add(h.HTMLAnchorButton(Text,Primary,href))
	AddCRLF
End Sub

'Add an hidden input form element
Public Sub AddInputHidden(Id As String, Value As String)
	pContent.Add(h.HTMLInputHidden(Id,Value))
	AddCRLF
End Sub

'Add an input button form element
Public Sub AddInputButton(Text As String, Primary As Boolean, Submit As Boolean, Id As String)
	pContent.Add(h.HTMLInputButton(Text,Primary,Submit,Id))
	AddCRLF	
End Sub

'Add some code block element (ie display some code)
Public Sub AddCode(Text As String)
	pContent.Add(h.HTMLCode(Text))
	AddCRLF	
End Sub

'Add a list element
'Ordered = True means the list will be numbered rather than bulleted
Public Sub AddList(Items As List, Ordered As Boolean)
	pContent.Add(h.HTMLList(Items,Ordered))
	AddCRLF	
End Sub

'Add an input checkbox form element
Public Sub AddInputCheckbox(Checked As Boolean, Id As String)
	pContent.Add(h.HTMLInputCheckbox(Checked,Id))
	AddCRLF
End Sub

'Add an input text element
'InputType: email, number, search, text, tel, url, password
Public Sub AddInputText(PlaceHolderText As String, Id As String, InputType As String, InitialValue As String)
	pContent.Add(h.HTMLInputText(PlaceHolderText,Id,InputType,InitialValue))
	AddCRLF
End Sub

'Add an input text area form element
'InputType: email, number, search, text, tel, url, password
Public Sub AddInputTextArea(PlaceHolderText As String, Id As String, InputType As String, InitialValue As String)
	pContent.Add(h.HTMLInputTextArea(PlaceHolderText,Id,InputType,InitialValue))
	AddCRLF
End Sub

'Add an input list form element
Public Sub AddInputList(Items As List, Id As String,Selected As String, IncludeBlank As Boolean)
	pContent.Add(h.HTMLInputList(Items,Id,Selected,IncludeBlank))	
	AddCRLF
End Sub

'Add a simple text label form element
Public Sub AddLabel(Text As String, Element As String)
	pContent.Add(h.HTMLLabel(Text,Element))
	AddCRLF
	'AddNBSP
End Sub

'Add a named div
Public Sub AddNamedDiv(Name As String)
	pContent.Add(h.HTMLNamedDiv(Name))	
	AddCRLF
End Sub

'Add an image element
Public Sub AddImage(Src As String, Width As String, Height As String, Alt As String, Link As String)
	pContent.Add(h.HTMLImage(Src, Width , Height, Alt, Link))
	AddCRLF
End Sub

'Add a named div with some content (style and text)
Public Sub AddNamedDivWithContent(Name As String, Style As String, Text As String)
	pContent.Add(h.HTMLNamedDivWithContent(Name,Style,Text))
	AddCRLF	
End Sub

'Add HTML directly (includes trailing CRLF)
Public Sub AddHTML(HTML As String)
	pContent.Add(HTML)	
	AddCRLF
End Sub

'Add a simple text hyperlink element
Public Sub AddLink(Text As String, Link As String)
	pContent.Add(h.HTMLLink(Text,Link))
	AddCRLF
End Sub

'Add an alert message (requires skeleton-alerts.css)
'AlertType: success, info, warning, error
Public Sub AddAlert(Title As String, Message As String, AlertType As String)	
	pContent.Add(h.HTMLAlert(Title,Message,AlertType))
	AddCRLF
End Sub

'Add a table element
Public Sub AddTable(Table As SK_Table)
	pContent.Add(h.HTMLTable(Table))	
	AddCRLF
End Sub

'Render
Public Sub Render As String
	Dim sb As StringBuilder
	sb.Initialize
	
	sb.Append(Begin_Column(pSize))
	
	For Each Content As String In pContent
		sb.Append(Content)
	Next
	
	sb.Append(Close_Div)
	
	Return sb.ToString
End Sub

Public Sub getSize As Int
	Return pSize
End Sub

Public Sub setSize(Size As Int)
	pSize = Size
End Sub

Private Sub AddCRLF
	pContent.Add(CRLF)
End Sub

Private Sub Begin_Column(Columns As Int) As String
	Dim ColumnText As String = Int_To_Word(Columns)
	
	If Columns > 1 Then
		Return "<div class=""" & ColumnText & " columns"">" & CRLF
	End If	
	
	Return "<div class=""" & ColumnText & " column"">" & CRLF
End Sub

Private Sub Close_Div As String
	Return "</div>" & CRLF
End Sub

Private Sub Int_To_Word(Input As Int) As String
	 If Input = 1 Then Return "one"
	 If Input = 2 Then Return "two"
	 If Input = 3 Then Return "three"
	 If Input = 4 Then Return "four"
	 If Input = 5 Then Return "five"
	 If Input = 6 Then Return "six"
	 If Input = 7 Then Return "seven"
	 If Input = 8 Then Return "eight"
	 If Input = 9 Then Return "nine"
	 If Input = 10 Then Return "ten"
	 If Input = 11 Then Return "eleven"
	 If Input = 12 Then Return "twelve"
	 
	 Return "twelve"
End Sub