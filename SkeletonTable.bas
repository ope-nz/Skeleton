Type=StaticCode
Version=4.7
ModulesStructureVersion=1
B4J=true
@EndOfDesignText@

Sub Process_Globals
	Type SK_Table(Header As List, Rows As List)
	
	Private SkeletonTableObject As SK_Table
End Sub

Public Sub getWidth As Int
	Return SkeletonTableObject.Header.Size
End Sub

Public Sub Initialize(HeaderList As List)
	SkeletonTableObject.Initialize
	SkeletonTableObject.Header.Initialize
	SkeletonTableObject.Header.Clear	
	
	SkeletonTableObject.Rows.Initialize
	SkeletonTableObject.Rows.Clear	
		
	SkeletonTableObject.Header = HeaderList
End Sub

Public Sub AddRow(Row As List)
	SkeletonTableObject.Rows.Add(Row)
End Sub

Public Sub UpdateRow(Index As Int, Row As List)
	SkeletonTableObject.Rows.RemoveAt(Index)
	SkeletonTableObject.Rows.InsertAt(Index,Row)	
End Sub

Public Sub RemoveRow(Index As Int)
	SkeletonTableObject.Rows.RemoveAt(Index)
End Sub

Public Sub getTable() As SK_Table
	Return SkeletonTableObject
End Sub