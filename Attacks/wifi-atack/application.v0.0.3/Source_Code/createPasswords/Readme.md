# *:DevGenius applicatino:*
# Password Generator Application  

Welcome to the **Password Generator** application! This app helps you generate random passwords based on numbers, names, or dates, and then save them to a `.txt` file.

## Created By
- **Samir Aoulad Amar**
- **Company**: DevGenius

You can find the source code on GitHub:
[https://github.com/samir20-23/](https://github.com/samir20-23/)

## Features
- Generate passwords based on:
  - Numbers
  - Names
  - Dates
- Save the generated passwords to a `.txt` file.

---

## How to Use the Application

### Prerequisites
To use this application, you'll need to have **Node.js** installed. You can download it here:  
[https://nodejs.org/](https://nodejs.org/)

### Easy Steps to Run the Application:

1. **Clone the Repository**  
   First, clone the repository to your local machine by running:
   ```bash
   git clone https://github.com/samir20-23/passwords-generator.git
   ```

2. **Navigate to the Project Folder**  
   Use `cd` to go to the project directory:
   ```bash
   cd passwords-generator
   ```

3. **Install Dependencies**  
   Install the necessary packages by running:
   ```bash
   npm install
   ```

4. **Run the Application**  
   Start the application by running:
   ```bash
   node createPasswords.js
   ```

5. **Follow the Prompts**  
   The application will prompt you to:
   - Select what type of passwords you want to generate (numbers, names, dates).
   - Optionally, provide a base number or name.
   - Choose where to save the generated passwords (e.g., `output.txt`).

### Example Interaction:
```plaintext
What do you want to generate? (numbers, names, dates, or quit): names
Do you have any names to add if you dont inter "no" or "n"? (name): chadia
chadia123
chadia124
...
What do you want to save . so inter  name the file? (example: output.txt): chadia.txt
Data successfully saved to chadia.txt
What do you want to generate? (numbers, names, dates, or quit):
```

6. **Check the Generated File**  
   After saving, check the `.txt` file for your generated passwords!

---

## Additional Information

- **Generate Numbers**: Allows you to input a starting number and generate multiple passwords by appending random digits.
- **Generate Names**: You can add a custom name to generate variations or use default names.
- **Generate Dates**: Generate password combinations based on a starting year, like `20102010`, `20102011`, etc.

---

### Troubleshooting

- If you encounter any issues or errors, feel free to raise an issue on the [GitHub repository](https://github.com/samir20-23/).

---

This is a simple and easy-to-use application for generating and saving passwords based on different inputs. Enjoy using it!

---