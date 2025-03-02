# File Encryption and Decryption System

## Overview
This assembly language program was developed as an educational semester project for the Computer Organization and Assembly Language course.Its designed to handle basic file encryption and decryption using a simple XOR cipher. Users can input a file name, and the program will either encrypt or decrypt the file content based on the selected mode.

> **Note**: While this program is designed for basic file encryption and decryption, there may still be some glitches or errors, especially depending on the operating environment and file sizes. Users are advised to test the program thoroughly and back up important data before use.

## Interface:
![1](https://github.com/user-attachments/assets/1abc4897-337f-4545-89a2-db37d497bbc1)
![2](https://github.com/user-attachments/assets/16681de8-3003-4dbb-82ad-6f0b6a00a8cb)
![3](https://github.com/user-attachments/assets/0c38ae03-f99b-4078-9ef2-412a11d86d94)


## Features

### 1. File Encryption:
- **Encrypts Files Using a Secure XOR Cipher**: 
  - This feature ensures that the file content is transformed into an unreadable format to maintain confidentiality.
- **Ensures Data Confidentiality**: 
  - The encryption process scrambles the file content so that only authorized individuals can access it.

### 2. File Decryption:
- **Decrypts Previously Encrypted Files**: 
  - This feature allows the user to recover the original content of a file, provided the correct password is entered.
- **Converts Encrypted File Back to Its Original Form**: 
  - Restores the scrambled file content to its readable state after successful decryption.

### 3. Password Protection:
- **Requires Password for Decryption**: 
  - Only users with the correct password can decrypt encrypted files, adding an additional layer of security.
- **Ensures Authorized Access**: 
  - Prevents unauthorized users from decrypting sensitive files.

### 4. File Locking:
- **Prevents Repeated Encryption**: 
  - If a file is already encrypted, the system will prevent further encryption attempts.
- **User Notification**: 
  - Notifies the user if an attempt is made to encrypt an already encrypted file.

### 5. Decryption Status Check:
- **Verifies File Encryption Status**: 
  - Before decryption, the system checks whether the file is encrypted. 
- **User Feedback**: 
  - Notifies the user if they attempt to decrypt a file that is not encrypted.

### 6. File Deletion Protection:
- **Automatically Deletes Files During Process**: 
  - To prevent unauthorized access and changes the system delete file temporarly so don't left encryption or decrypton process in middle .
  
### 7. File System Integration:
- **Hides Encrypted Files from the Operating System**: 
  - The system hides encrypted files to prevent unauthorized access.
- **Sets Files to Read-Only**: 
  - Protects encrypted files from being modified until they are decrypted.

### 8. User Interface:
- **User-Friendly Interface**: 
  - The program utilizes BIOS and DOS interrupts to manage user input and output, making it simple and intuitive to navigate.
- **Clear Prompts and Notifications**: 
  - The system provides feedback at every step, ensuring users know the current status of the file encryption or decryption process.



## Use Case Scenarios

### 1. Encrypting a File:
- **Step 1**: The user enter file name with extension `txt` to be encrypted.
- **Step 2**: The system checks if the file is already encrypted.
- **Step 3**: If the file is not already encrypted, the system encrypts the file, hides it from the OS, and sets it to read-only.

### 2. Decrypting a File:
- **Step 1**: The user enter file name with extension `txt` to be decrypted.
- **Step 2**: The system checks if the file is encrypted.
- **Step 3**: If the file is encrypted, the system prompts the user for the correct password.
- **Step 4**: If the correct password is entered, the system decrypts the file, restores it to its original form, and deletes the encrypted version to prevent duplication.



## How It Works

1. **Running the Program**: 
   - Assemble the code using an 8086 emulator (e.g., EMU8086).
   - Ensure that the file you want to encrypt or decrypt is located in the `MyBuild` folder, typically found in `C:\Program Files\Emu8086\MyBuild`. The file should be in `.txt` format.
   
2. **Input**:
   - The program will prompt you to enter the name of the file (including the extension, e.g., `file.txt`).
   - The system will then allow you to choose whether to encrypt or decrypt the file.

3. **Encryption/Decryption**:
   - Encryption will scramble the contents of the file using an XOR cipher.
   - Decryption will reverse the XOR operation, provided the correct password is entered.

4. **File Protection**:
   - The program prevents unauthorized decryption through password protection and ensures file security by hiding the file from the OS when it is encrypted.



## Potential Issues and Limitations

- This program may contain **glitches or errors** based on the operating environment or file sizes. It is recommended to test the program with non-critical data first.
- **File Size Limitations**: The program might face issues when dealing with larger files.
- **Platform Dependency**: Since the program relies on BIOS and DOS interrupts, it may not function correctly on modern operating systems without an emulator.



## How to Run

1. **Assembly**:
   - Use an 8086 emulator to assemble and run the program. You can use EMU8086 or any other compatible emulator.
   
2. **File Location**:
   - Ensure that the file to be encrypted or decrypted is a `.txt` file located in the `MyBuild` folder (Typically found in: `C:\Program Files\Emu8086\MyBuild`).
   
3. **Execution**:
   - Run the program, input the file name (with extension), and follow the on-screen instructions to either encrypt or decrypt the file.
## Purpose
This project is designed purely for educational purposes to learn **COAL concepts** and may require further refinement.



## Author
> **This project is owned by [Muhammad Jawad Ahmad](https://www.linkedin.com/in/JawadAhmadCS/) and is not the property of any institution. Feel free to use it for educational purposes.**

  
---
