# Java-Pronoun-Use-Movies

This repository contains a Java application that utilizes the Processing library to analyze the number of personal pronouns used in a film. The application makes use of CSV files containing movie data and character information to perform the analysis.

## Features

- **Movie Selection**: The application provides a user interface with a CP5 DropDownMenu that lists all the movie tiles. The movies are displayed in the same order as they appear in the CSV file.

- **Character Selection**: Once a movie is selected from the DropDownMenu, the application retrieves the corresponding movie ID. It then creates a HashMap to store all character names from the second CSV file and displays them in a second DropDownMenu.

- **Pronoun Analysis**: When a character is selected from the second DropDownMenu, the application retrieves the character ID. It filters the CSV file based on the selected character ID and extracts all the character's lines into a StringList. Each line is then split into separate words, and the RiTa.pos function is applied to each word. The resulting parts of speech are stored in a new StringList.

- **Pronoun Counting**: Using an if loop, the application calculates the number of strings in the StringList that correspond to personal pronouns ("prp"). It compares this count to the total number of strings to determine the pronoun usage. The results are displayed on a CP5 Pie chart.

## Usage

To use this application, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in your preferred Java development environment.
3. Ensure that the Processing library is properly set up and configured.
4. Import the necessary CSV files containing the movie data and character information.
5. Build and run the application.
6. Use the CP5 DropDownMenus to select a movie and character for analysis.
7. View the pronoun usage results displayed on the CP5 Pie chart.
