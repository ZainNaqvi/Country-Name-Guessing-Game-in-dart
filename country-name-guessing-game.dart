// *********************************************************************
// ________________________________________________________________________

//  ***********************COUNTRY NAME GUESSING GAME*****************
// ________________________________________________________________________

// ************************************************************************

import 'dart:io';
import 'dart:math';
// print statements colors for the terminal in dart cyan blue color
void printTitle(String text) {
  print('\x1B[34m$text');
}

// print statements colors for the terminal in dart cyan yellow color
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

// print statements colors for the terminal in dart cyan red color
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

// print statements colors for the terminal in dart green red color
void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
}

// print statements colors for the terminal in dart green red color
void printReset(String text) {
  print('\x1B[36m$text\x1B[0m');
}

// using the score variable as the global scope here...
double score = 0;
double lifeLines = 3;
// global list
var list = [
  "PAKISTAN",
  "BANGLADESH",
  "INDIA",
  "Indonesia",
  "Philippines",
  "Vietnam",
  "Thailand",
  "Cyprus",
  "Kazakhstan",
  "SRILANKA",
  "Qatar",
  "Myanmar",
  "CHINA",
  "Singapore",
  "Bhutan",
  "South Korea",
  "JAPAN",
  "TURKEY",
  "Afghanistan",
  "Saudi Arabia",
  "Nepal",
  "North Korea",
  "IRAN",
  "IRAQ",
];
void main() {
  String name = InputCreaditials();

  // display the starter of the game
  String choice = "YES";
  Display();
  do {
    // displaying the rules here...
    printWarning("\nWould you like to play? ");
    printBlue("YES / NO");
    choice = stdin.readLineSync()!.toUpperCase();
    if (choice == "NO") {
      break;
    }
    // displaying the asian country list
    printReset("The Asian countries!.");
    // Life lines
    printError(
        "\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r                                                                           LIFE LINES $lifeLines❤");
    // displaying those countries
    printError(CountriesList().toString());
    // guess this country string
    var correctGuess = GuessSortedCountry();
    // get the hint
    GuessHint(correctGuess);
    // get the user input
    var userInputCountry = UserInputCountry();
    // check the user input here...
    if (userInputCountry.toString().toUpperCase() ==
        correctGuess.toString().toUpperCase()) {
      printReset("Correct Guess!🧡");
      score = score + 10;
      printTitle("Your score $score");
    } else {
      printError("Wrong Guess!🧡");
      lifeLines = lifeLines - 1;
      printError(
          "\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r                                                                           LIFE LINES $lifeLines💔");
      score = score + 0;
      printTitle("Your score $score");
    }
    if (lifeLines == 0) {
      break;
    }
  } while (choice != "NO");
  if (score > 20) {
    printBlue("Good luck for the next time");
  } else if (score < 10) {
    printError("Bad luck");
  } else {
    printWarning("Let's Play Again!");
  }
  printError("$name YOUR SCORE IS $score🤍");
  printError(
      "************************************************************************");
  printReset(
      "_________________________________________________________________________");
  printWarning("THANK YOU SO MUCH FOR PLAYING THIS GAME");
  printError("DESIGNED & DEVELOPED BY SYED ZAIN HAIDER NAQVI❣");
}

// hints for the user are
GuessHint(String country) {
  printReset("Note: USING HINT MAY EFFECT TO YOUR SCORE BY -5 POINTS");
  printBlue("Menu");
  printTitle("1: HINT COUNTRY'S STARTING CHARACTER (*-5* POINTS )");
  printTitle("2: HINT COUNTRY'S ENDING CHARACTER (*-5* POINTS )");
  printTitle("3: HINT REVERSED THE COUNTRY NAME (*-5* POINTS )");
  printTitle("4: HINT PROVIDE THREE OPTIONS (*-10* POINTS )");
  printTitle("5: FOR QUIT (*-0* POINTS)");
  String userChoice = stdin.readLineSync()!;
  switch (userChoice) {
    case "1":
      printWarning("Starting character of the country is ${country[0]}");
      score = score - 5;
      printBlue("Your score is $score");
      break;
    case "2":
      var countriesLength = country.length;
      printWarning(
          "ENDING CHARACTER OF THE COUNTRY IS ${country[countriesLength - 1]}");
      score = score - 5;
      printBlue("Your score is $score");
      break;
    case "3":
      printWarning(
          "REVERSED OF THE COUNTRY NAME IN ${country.split('').reversed}");
      score = score - 10;
      printBlue("Your score is $score");
      break;
    case "4":
      printTitle("Options");
      printError("1: ${list[RandomCountries()]}");
      printError("2: ${list[RandomCountries()]}");
      printError("3: ${country}");
      score = score - 10;
      printBlue("Your score is $score");
      break;
    case "5":
      printWarning("Thank You!🤍");
      score = score - 0;
      printBlue("Your score is $score");
      break;
    default:
      printBlue("Invalid.");
  }
}

// guess the sorting country here...
GuessSortedCountry() {
  var randomNumber = RandomCountries();
  var listItem = list[randomNumber];
  var reversed = listItem.toString().split('').reversed;
  // for the string country values to set sort
  print(reversed.toList()..sort());
  return listItem;
}

// get the user input ... user country guess value
UserInputCountry() {
  printTitle("Complete the Country Name");
  var userGuess = stdin.readLineSync()!;
  return userGuess;
}

// random countries generating here...
int RandomCountries() {
  Random random = new Random();
  int randomNumber = random.nextInt(list.length);
  return randomNumber;
}

// All the countries are  :
CountriesList() {
  return list;
}

// get the user information => name
String InputCreaditials() {
  print('\x1B[94m' + "hahAHaHA!!!" + '\x1B[0m');
  printBlue("________________________");
  print('\x1B[94m' + "ENTER YOUR NAME HERE!!!⚫" + '\x1B[0m');

  String name = stdin.readLineSync()!.toUpperCase();
  return name;
}

// Display function for displaying the rules and regulation of the game below
Display() {
  TitleMenuLoop();
  printTitle(
      "\n\n\t\t\t\t\t---------------  GUESSING GAME   --------------------");
  printWarning(
      "\n\t\t\t\t\tA GROUP OF WORDS IS SHOWN ON SCREEN . YOU HAVE TO GUESS A HIDDEN CORRECT NAME \n\t\t\t\t\tFROM THE GIVEN QUIZ. FOR EACH CORRECT GUESSING YOU WILL GET TEN SCORE.ALL THE COUNTRIES ARE ASIAN COUNTRIES");
  TitleMenuLoop();
}

// border loop for the designing ....
TitleMenuLoop() {
  for (var i = 0; i < 170; i++) {
    stdout.write("_");
  }
  print("");

  for (var i = 0; i < 170; i++) {
    stdout.write("*");
  }
}
