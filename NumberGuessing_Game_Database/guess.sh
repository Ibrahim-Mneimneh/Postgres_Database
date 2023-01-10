#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=games_played -t --no-align -c"
echo Enter your username:
read USERNAME

SEARCH_USERNAME_SCORE=$($PSQL "SELECT best_game FROM player WHERE username='$USERNAME' ")
if [[ -z $SEARCH_USERNAME_SCORE ]]
then
  add_user=$($PSQL "INSERT INTO player(username, best_game, games_played) VALUES('$USERNAME', 999, 0)")
  SEARCH_USERNAME_SCORE=$($PSQL "SELECT best_game FROM player WHERE username='$USERNAME' ")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  SEARCH_USERNAME_PLAYED=$($PSQL "SELECT games_played FROM player WHERE username='$USERNAME' ")
  SCORE=SEARCH_USERNAME_
  echo "Welcome back, $USERNAME! You have played $SEARCH_USERNAME_PLAYED games, and your best game took $SEARCH_USERNAME_SCORE guesses."
fi

echo Guess the secret number between 1 and 1000:
secret_number=$(( ($RANDOM % 1000)+1 ))
read GUESS
number_of_guesses=0


while [[ $GUESS != $secret_number ]]
do
  while ! [[ $GUESS =~ ^[0-9]*$ ]]
  do
    echo That is not an integer, guess again:
    read GUESS
  done
if [[ $GUESS -gt $secret_number ]]
  then
  echo "It's lower than that, guess again:"
  read GUESS
  number_of_guesses=$(($number_of_guesses+1))
elif [[ $GUESS -lt $secret_number ]]
  then
  echo "It's higher than that, guess again:"
  read GUESS
  number_of_guesses=$(($number_of_guesses+1))
fi

if [[ $GUESS == $secret_number ]]
  then
  number_of_guesses=$(($number_of_guesses+1))
  echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
  if [[ $number_of_guesses -lt $SEARCH_USERNAME_SCORE ]]
  then
    result1=$($PSQL "UPDATE player SET games_played=$(($SEARCH_USERNAME_PLAYED+1)) WHERE username='$USERNAME'")
    result2=$($PSQL "UPDATE player SET best_game=$number_of_guesses WHERE username='$USERNAME'")
  else
    result3=$($PSQL "UPDATE player SET games_played=$(($SEARCH_USERNAME_PLAYED+1)) WHERE username='$USERNAME'")
  fi
fi
done
