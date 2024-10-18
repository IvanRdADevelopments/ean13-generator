; Nombre del instalador
OutFile "EAN13_Generator.exe"

; Nombre de la aplicación
Name "EAN13 BarCode Generator"

; Directorio de instalación predeterminado
InstallDir "$PROGRAMFILES\EAN13_GENERATOR"

; Icono del instalador (opcional)
; Si no tienes un archivo .ico puedes comentar esta línea
Icon "icon.ico"

; Página de instalación
Page instfiles

; Sección principal para instalar los archivos
Section "InstallDir"

    ; Definir el directorio de salida (donde se instalarán los archivos)
    SetOutPath "$INSTDIR"

    ; Copiar el archivo main.exe desde la carpeta dist
    File "dist\main.exe"

    ; Copiar la fuente descargada en el directorio raíz del proyecto
    File "DejaVuSans-Bold.ttf"

    ; Crear acceso directo en el escritorio
    CreateShortCut "$DESKTOP\EAN13_Barcode_Generator.lnk" "$INSTDIR\main.exe"

    ; Crear acceso directo en el menú de inicio
    CreateShortCut "$SMPROGRAMS\EAN13 BarCode Generator\EAN13_Barcode_Generator.lnk" "$INSTDIR\main.exe"

    ; Crear acceso directo para la desinstalación en el menú de inicio
    WriteUninstaller "$INSTDIR\uninstall.exe"
    CreateShortCut "$SMPROGRAMS\EAN13 BarCode Generator\Uninstall.lnk" "$INSTDIR\uninstall.exe"

SectionEnd


; Sección para desinstalar (solo se ejecuta si se llama explícitamente)
Section "Uninstall"

    ; Eliminar accesos directos
    Delete "$DESKTOP\EAN13_Barcode_Generator.lnk"
    Delete "$SMPROGRAMS\EAN13 BarCode Generator\EAN13_Barcode_Generator.lnk"
    Delete "$SMPROGRAMS\EAN13 BarCode Generator\Uninstall.lnk"

    ; Eliminar los archivos del directorio de instalación
    RMDir /r "$INSTDIR"

    ; Eliminar el directorio del menú de inicio
    RMDir /r "$SMPROGRAMS\EAN13 BarCode Generator"

SectionEnd
