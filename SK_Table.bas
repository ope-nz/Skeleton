Type=StaticCode
Version=4.7
ModulesStructureVersion=1
B4J=true
@EndOfDesignText@

Sub Process_Globals
	Private pHeader As List
	Private pRows As List
End Sub

Public Sub getWidth As Int
	Return pHeader.Size
End Sub

Public Sub Initialize(HeaderList As List)
	pHeader.Initialize
	pRows.Initialize	
	pHeader = HeaderList
End Sub

Public Sub AddRow(Row As List)
	pRows.Add(Row)
End Sub

Public Sub UpdateRow(Index As Int, Row As List)
	pRows.RemoveAt(Index)
	pRows.InsertAt(Index,Row)	
End Sub

Public Sub RemoveRow(Index As Int)
	pRows.RemoveAt(Index)
End Sub