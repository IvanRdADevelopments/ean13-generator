# EAN-13 Barcode Generator

Este proyecto es un generador de códigos de barras EAN-13 que permite ingresar una referencia alfanumérica, convertirla a un formato numérico único y generar un archivo PNG con el código de barras correspondiente.

## ⚙️ Requerimientos

- Python 3.6+
- Entorno virtual de Python (opcional, pero recomendado)
- Las siguientes dependencias listadas en `requirements.txt`:

  ```bash
  Pillow==9.3.0
  python-barcode==0.13.1
🚀 Instalación y Configuración
1. Clonar el repositorio
Clona el repositorio en tu máquina local:

bash
Copiar código
git clone https://github.com/tu-usuario/ean13-generator.git
cd ean13-generator
2. Crear un entorno virtual (opcional pero recomendado)
Para aislar las dependencias del proyecto:

bash
Copiar código
python -m venv venv
Activa el entorno virtual:

En Windows:

bash
Copiar código
venv\Scripts\activate
En macOS/Linux:

bash
Copiar código
source venv/bin/activate
3. Instalar las dependencias
Instala las dependencias desde requirements.txt:

bash
Copiar código
pip install -r requirements.txt
4. Ejecutar el programa
Una vez configurado el entorno virtual y las dependencias, puedes ejecutar el programa usando:

bash
Copiar código
python main.py
📝 Uso
Al ejecutar el programa, aparecerá una ventana de la aplicación donde podrás:

Ingresar una referencia alfanumérica.
Pulsar el botón "Generar Código de Barras".
El programa convertirá la referencia en un código de barras EAN-13 y lo guardará en formato PNG en el directorio codigos_barras.
Si el código de barras ya fue generado previamente, el programa mostrará una advertencia.

⚠️ Notas importantes
No es necesario modificar el código fuente para generar el código de barras. El programa está listo para usar y generará el archivo PNG automáticamente.
El archivo .venv no está incluido en el repositorio. Deberás crear tu propio entorno virtual y asegurarte de que las dependencias estén instaladas.
🐞 Depuración
Si encuentras errores o problemas durante la ejecución:

Asegúrate de que las dependencias están instaladas correctamente con pip install -r requirements.txt.
Verifica que el entorno virtual esté activo.
Si el problema persiste, revisa el archivo de log generado por el script init.bat si usas la opción de arranque automático con init.vbs.