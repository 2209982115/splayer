Set objShell = CreateObject("Shell.Application")
Set filesystem = CreateObject("scripting.Filesystemobject")
Set objFolder = objShell.Namespace(filesystem.GetParentFolderName(Wscript.Arguments(1)))
Set objFolderItem = objFolder.ParseName(filesystem.GetFileName(WScript.Arguments(1)))
Set colVerbs = objFolderItem.Verbs
Dim vname
For Each objVerb in colVerbs
    vname = Replace(objVerb.name, "&", "")
        If Wscript.Arguments(0) = "unpin"  Then
          If InStr(vname , "Unpin") = 1 And InStr(vname , "Taskbar") > 1 Or (InStr(vname , "从任务栏解锁") > 0) Or (InStr(vname , "從工作列取消釘選") > 0)  Then
             objVerb.DoIt
          End If
        Else
          If ( InStr(vname , "Pin") = 1 And InStr(vname , "Taskbar") > 1 ) Or (InStr(vname , "锁定到任务栏") > 0)  Or (InStr(vname , "釘選到工作列") > 0) Then
              If InStr(vname , "Pin") = 1 Then
                objVerb.DoIt
              End If
          End If
        End If
Next