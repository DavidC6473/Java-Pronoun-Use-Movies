# Java-Pronoun-Use-Movies
Application to test the number of personal pronouns used in a film

I Created a CP5 DropDownMenu and placed all of the movie tiles into it. Since the items in the
DropDown were stored in the same order as the CSV file, by getting the number of the item
selected, I could add the letter m to it, creating a string that would match the movie ID. I created a
HashMap that would store all character names from the second CSV file once the movie ID matched
the one selected and placed them into a second DropDown. Once a character was selected from this
list, I got the character ID and filtered the CSV, extracting all of the characters lines to a StringList. I
then split this into separate words and ran RiTa.pos on each word, storing the results in a new
StringList. Using an if loop, I calculated how many of these strings were “prp” and compared that to
the total number of strings. I then stored the results on a CP5 Pie chart. I encountered a problem
where my prp counter was not correctly counting the number of prp’s in the list, which I was unable
to solve.
