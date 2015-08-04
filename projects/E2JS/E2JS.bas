Attribute VB_Name = "E2JS"
Sub copyAsArrayOfArrays()
Attribute copyAsArrayOfArrays.VB_ProcData.VB_Invoke_Func = "J\n14"
    'VBA Macro to create a string from a selection of cells, formatted as a JavaScript array (of arrays)
    'Created by Patrick Moore
    'MIT License
    Dim rngSel As Range
    Set rngSel = Selection
    
    Dim strArray As String
    
    For y = 1 To rngSel.Rows.Count
    
        For x = 1 To rngSel.Columns.Count
            
            If x = 1 Then
                strArray = strArray & "["
            End If
            
            If x <> rngSel.Columns.Count Then
                strArray = strArray & rngSel.Cells(y, x).Value & ","
            Else
                strArray = strArray & rngSel.Cells(y, x).Value & "]"
            End If
            
           ' Debug.Print strArray
        
        Next
    
        If y <> rngSel.Rows.Count Then
            strArray = strArray & "," & vbNewLine
        End If

    Next
    strArray = "[" & strArray & "]"
    Debug.Print strArray
    CopyText (strArray)

End Sub


Sub CopyText(Text As String)
    'VBA Macro using late binding to copy text to clipboard.
    'By Justin Kay, 8/15/2014
    'Thanks to http://akihitoyamashiro.com/en/VBA/LateBindingDataObject.htm
    Set MSForms_DataObject = CreateObject("new:{1C3B4210-F441-11CE-B9EA-00AA006B1A69}")
    MSForms_DataObject.SetText Text
    MSForms_DataObject.PutInClipboard
    Set MSForms_DataObject = Nothing
End Sub

