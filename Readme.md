# Basic Concepts: Console, Terminal, Shell, and Commands

This document explains the fundamental concepts of interacting with a computer using the command line.

## 1. Console
The **console** is the general concept of **interacting with a computer using text**. Originally, it was a physical device consisting of a screen and a keyboard directly connected to the machine. Today, the console has been virtualized, but it still represents the idea of a text-based interface that allows communication with the system. It is only used for displaying.

---

## 2. Terminal
A **terminal** is a program or application that opens a window for typing commands and viewing results. The terminal does not execute commands itself; it receives input, sends it to the shell, and displays the output returned by the shell. It essentially manages text-based input and output between the user and the shell.

---

## 3. Shell
The **shell** is the program that interprets and executes commands. It receives commands from the terminal, analyzes them, sends instructions to the system to perform actions or calculations, and then returns the results to the terminal for display.

---

## 4. Command and Arguments
A **command** is an instruction given to the shell, and **arguments** are additional options or parameters that modify the behavior of the command or specify its target. When a command is typed into the terminal, the terminal sends it to the shell, which interprets and executes it via the system, then returns the result to the terminal for display.

---

## Conclusion
The console represents the concept of text-based interaction, the terminal is the window that manages input and output, the shell is the program that interprets and executes commands, and commands with arguments are the instructions provided by the user. Together, these elements form a complete system that allows users to communicate with and control the computer using text commands.

------



# Archiving script
To run the script : 
- Open a terminal
- Write : "./run.sh urls.txt DOWNLOAD ARCHIVES"  
  DOWNLOAD → name of the folder where the downloaded files will be stored  
  ARCHIVES> → name of the folder where the .tar.gz archive will be stored
