import readline from 'readline';
import fs from 'fs';
import chalk from 'chalk';

// Create readline interface
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const startNames = ["mohamed", "samirsamir", "hasanhasan", "hamzahamza", "hafsahafsa"];
let generatedData = [];

function generateNumbers() {
    rl.question('Do you have any numbers to add or need to start with a specific number? (yes/start): ', (answer) => {
        if (answer.toLowerCase() === 'yes' || answer.toLowerCase() === 'start') {
            rl.question('Enter the starting number (e.g., 06): ', (baseNumber) => {
                rl.question('How many passwords would you like to generate? (e.g., 3000): ', (inputLines) => {
                    const lines = parseInt(inputLines, 10);

                    if (isNaN(lines) || lines < 1 || lines > 10000) {
                        console.log(chalk.red('Please enter a valid number of lines (1 - 10000).'));
                        generateNumbers(); // Restart the process
                        return;
                    }

                    for (let i = 0; i < lines; i++) {
                        const number = `${baseNumber}${Math.floor(Math.random() * 1000000).toString().padStart(6, '0')}`;
                        console.log(chalk.green(number)); // Display in green
                        generatedData.push(number);
                    }
                    askSaveFile(); // Save the generated numbers to a file
                });
            });
        } else {
            // Generate a sequence of default numbers
            for (let i = 0; i < 1000; i++) {
                const num = `12345678${i}`;
                console.log(chalk.green(num)); // Display in green
                generatedData.push(num);
            }
            askSaveFile();
        }
    });
}

function generateDates() {
    rl.question('Do you have any starting year for date passwords? (yes/start): ', (answer) => {
        if (answer.toLowerCase() === 'yes') {
            rl.question('Enter the starting year (e.g., 2010): ', (year) => {
                for (let i = parseInt(year); i <= 2032; i++) {
                    const datePassword = `${i}${i + 1}`;
                    console.log(chalk.green(datePassword)); // Display in green
                    generatedData.push(datePassword);
                }
                askSaveFile();
            });
        } else {
            // Generate simple date passwords
            for (let i = 2010; i <= 2032; i++) {
                const datePassword = `${i}${i + 1}`;
                console.log(chalk.green(datePassword)); // Display in green
                generatedData.push(datePassword);
            }
            askSaveFile();
        }
    });
}

function generateNames() {
    rl.question('Do you have any names to add if you dont inter "no" or "n"? (name): ', (name) => {
        if (name.toLowerCase() === 'no' || name.toLowerCase() === 'n') {
            for (const baseName of startNames) {
                generateNameVariations(baseName);
            }
            askSaveFile();
        } else {
            generateNameVariations(name);
            askSaveFile();
        }
    });
}

function generateNameVariations(baseName) {
    for (let offset = 0; offset < 100; offset++) {
        const randomPassword = generateRandomPassword(baseName); // Generate a random password
        console.log(chalk.green(randomPassword)); // Display in green
        generatedData.push(randomPassword);
    }
}

function generateRandomPassword(baseName) {
    // Generate random characters and numbers for password complexity
    const randomLength = Math.floor(Math.random() * (12 - 8 + 1)) + 8; // Length between 8 and 12
    let password = baseName;

    // Add random numbers and letters after the base name
    for (let i = baseName.length; i < randomLength; i++) {
        const randomChar = Math.random() < 0.5
            ? String.fromCharCode(Math.floor(Math.random() * 10) + 48) // Random digit (0-9)
            : String.fromCharCode(Math.floor(Math.random() * 26) + 97); // Random lowercase letter (a-z)
        password += randomChar;
    }

    return password;
}

function askSaveFile() {
    rl.question('What do you want to save . so inter  name the file? (example: output.txt): ', (filename) => {
        // Ensure file has .txt extension
        if (!filename.endsWith('.txt')) {
            filename += '.txt';
        }
        saveToFile(filename);
    });
}

function saveToFile(filename) {
    // Check if file exists, create if it doesn't
    fs.access(filename, fs.constants.F_OK, (err) => {
        if (err) {
            // File does not exist, create it and write data
            fs.writeFile(filename, generatedData.join('\n') + '\n', (writeErr) => {
                if (writeErr) {
                    console.log('Error saving to file:', writeErr);
                } else {
                    console.log(chalk.green(`Data successfully saved to ${filename}`)); // Display success message in green
                }
                generatedData = []; // Clear the data after saving
                promptUser();
            });
        } else {
            // File exists, append data to it
            fs.appendFile(filename, generatedData.join('\n') + '\n', (appendErr) => {
                if (appendErr) {
                    console.log('Error saving to file:', appendErr);
                } else {
                    console.log(chalk.green(`Data successfully appended to ${filename}`)); // Display success message in green
                }
                generatedData = []; // Clear the data after saving
                promptUser();
            });
        }
    });
}

function promptUser() {
    rl.question('What do you want to generate? (numbers, names, dates, or quit): ', (answer) => {
        if (answer.toLowerCase() === 'numbers') {
            generateNumbers();
        } else if (answer.toLowerCase() === 'names') {
            generateNames();
        } else if (answer.toLowerCase() === 'dates') {
            generateDates();
        } else if (answer.toLowerCase() === 'quit') {
            console.log('Goodbye!');
            rl.close();
        } else {
            console.log('Invalid option, please try again.');
            promptUser();
        }
    });
}

// Start the prompt
promptUser();