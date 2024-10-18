# EAN-13 Barcode Generator
## Project Description: 
This project is an EAN-13 barcode generator that allows you to input an alphanumeric reference, convert it into a unique numeric format, and generate a PNG file with the corresponding barcode.

## Requirements
List of requirements:

Python 3.6+
Python virtual environment (optional, but recommended)
Dependencies listed in requirements.txt:
Code for dependencies (code block):
makefile
Copiar código
Pillow==9.3.0
python-barcode==0.13.1
Installation and Setup

### 1. Clone the repository
Clone the repository to your local machine:

Code to clone the repository (code block):

bash
```
git clone https://github.com/IvanRdADevelopments/ean13-generator.git
cd ean13-generator
```

### 2. Create a virtual environment (optional but recommended)
To isolate the project dependencies:

Code to create a virtual environment (code block):
```
python -m venv venv
```

### Activate the virtual environment:
On Windows:
Code to activate the virtual environment on Windows (code block):

```
venv\Scripts\activate
```

On macOS/Linux:

Code to activate the virtual environment on macOS/Linux (code block):
bash
```
source venv/bin/activate
```

### 3. Install dependencies
Install the dependencies from requirements.txt:

Code to install dependencies (code block):
```
pip install -r requirements.txt
```

### 4. Run the program
Once the virtual environment is set up and the dependencies are installed, you can run the program using:

Code to run the program (code block):
```
python main.py
```

## Usage
When you run the program, a window will appear where you can:

Enter an alphanumeric reference.
Click the "Generate Barcode" button.
The program will convert the reference into an EAN-13 barcode and save it as a PNG file in the codigos_barras directory.
If the barcode has already been generated, the program will show a warning.

## Important Notes
There's no need to modify the source code to generate the barcode. The program is ready to use and will automatically generate the PNG file.
The .venv folder is not included in the repository. You will need to create your own virtual environment and ensure that the dependencies are installed.

##Debugging
If you encounter any errors or issues during execution:

Ensure that the dependencies are correctly installed with pip install -r requirements.txt.
Verify that the virtual environment is active.
If the problem persists, check the log file generated by the init.bat script if you use the auto-launch option with init.vbs.