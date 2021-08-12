Set oArgs = WScript.Arguments

intCaseSensitive = 0
For i = 3 to oArgs.Count-1
    If UCase(oArgs(i)) = "/I" Then intCaseSensitive = 1
Next

Set oFSO = CreateObject("Scripting.FileSystemObject")

If Not oFSO.FileExists(oArgs(0)) Then
    WScript.Echo "Specified file does not exist."
Else
    Set oFile = oFSO.OpenTextFile(oArgs(0), 1)
    strText = oFile.ReadAll

    oFile.Close

    strText = Replace(strText, oArgs(1), oArgs(2), 1, -1, intCaseSensitive)
    Set oFile = oFSO.OpenTextFile(oArgs(0), 2)

    oFile.WriteLine strText
    oFile.Close
End If
