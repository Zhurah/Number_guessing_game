#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

if [[ -z $USER_ID ]]
then 
  echo "Welcome, $USERNAME It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

else
  GAME_PLAYED=$($ "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME=$($ "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")

  echo "Welcome back, $USERNAME You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi
  
  
  
