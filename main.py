import barcode
from barcode.writer import ImageWriter
import tkinter as tk
from tkinter import messagebox
import random
import os
import sys

# Mapping unique numbers from given char
char_to_number = {
    'A': '01', 'B': '02', 'C': '03', 'D': '04', 'E': '05', 'F': '06',
    'G': '07', 'H': '08', 'I': '09', 'J': '10', 'K': '11', 'L': '12',
    'M': '13', 'N': '14', 'O': '15', 'P': '16', 'Q': '17', 'R': '18',
    'S': '19', 'T': '20', 'U': '21', 'V': '22', 'W': '23', 'X': '24',
    'Y': '25', 'Z': '26'
}

# Function to convert the given reference to a just numbers
def convert_to_numbers(reference):
    converted_reference = ''
    
    for char in reference.upper():
        if char.isdigit():  # If it is a number we leave it
            converted_reference += char
        elif char.isalpha():  # If it is a char, we convert it to a number
            converted_reference += char_to_number.get(char, '')
        else:
            # If any special char is included we throw an Exception
            messagebox.showerror("Error", f"Carácter no permitido: {char}")
            return None
    
    return converted_reference

# Function to return just 13 numbers from the reference
def adjust_to_13_digits(converted_reference):
    if len(converted_reference) > 13:
        # If it is larger than 13 chars, we cut it randomly
        start_index = random.randint(0, len(converted_reference) - 13)
        truncated_reference = converted_reference[start_index:start_index + 13]
        return truncated_reference
    elif len(converted_reference) < 13:
        # If it is shorter, we fill the reference with 0 on left and right sides
        zeros_to_add = 13 - len(converted_reference)
        left_zeros = zeros_to_add // 2
        right_zeros = zeros_to_add - left_zeros
        refilled_reference = '0' * left_zeros + converted_reference + '0' * right_zeros
        return refilled_reference
    else:
        return converted_reference

# Function to generate de barcode
def generarate_barcode(reference, original_reference, formato="ean13"):
    # Create the directory if not exists
    output_folder = 'barcodes'
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Define the patih to the output file
    output_file = os.path.join(output_folder, original_reference)

    # Verify if the file exists, if so we show a warning
    if os.path.exists(f"{output_file}.png"):
        messagebox.showwarning("Advertencia", f"Referencia {original_reference}.png ya generada. Revise el directorio de códigos generados.")
        return

    # Generate the barcode
    if formato == "ean13":
        Barcode = barcode.get_barcode_class('ean13')
    else:
        raise ValueError("Formato no soportado. Usa 'ean13'.")

    # Create the barcode and store the file
    codigo = Barcode(reference, writer=ImageWriter())
    codigo.save(output_file)

    # Notify the user that file was saved
    messagebox.showinfo("Éxito", f"Código de barras guardado en {output_file}.png")

# Funtion to validate the input reference
def validate_reference():
    original_reference = entry.get()

    # Convert from alphanumeric to numeric
    converted_reference = convert_to_numbers(original_reference)

    if converted_reference:
        # Adjust to 13 digits
        adjusted_reference = adjust_to_13_digits(converted_reference)
        
        # Generarate the barcode using the adjusted reference for the code and the original for the file name
        generarate_barcode(adjusted_reference, original_reference)

# Configuration of the main window in Tkinter
root = tk.Tk()
root.title("Generador de Códigos de Barras EAN-13")
root.geometry("400x200")

# Tag and input of the reference
label = tk.Label(root, text="Introduce la referencia alfanumérica para el código de barras:")
label.pack(pady=10)

entry = tk.Entry(root)
entry.pack(pady=5)

# Button to store the code
generate_btn = tk.Button(root, text="Generar Código de Barras", command=validate_reference)
generate_btn.pack(pady=20)

# Keep the window opened
root.mainloop()
