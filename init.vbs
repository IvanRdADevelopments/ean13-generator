Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Obtener el directorio donde está el script .vbs
scriptDir = objFSO.GetParentFolderName(WScript.ScriptFullName)

' Ejecutar el archivo .bat desde el mismo directorio
objShell.Run "cmd /c """ & scriptDir & "\init.bat""", 0, True
