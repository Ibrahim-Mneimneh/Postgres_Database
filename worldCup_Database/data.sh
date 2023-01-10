#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo $($PSQL "TRUNCATE games,teams")
# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
#year insertion

if (( YEAR !='year' ))
then

winning_team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ")
opponent_team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ")

if [[ -z $winning_team_id ]]
then
  team_add=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

fi

if [[ -z $opponent_team_id ]]
then
  team_add_result=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  
fi


winning_team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ")
opponent_team_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ")

$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES( $YEAR, '$ROUND', $winning_team_id, $opponent_team_id, $WINNER_GOALS, $OPPONENT_GOALS )"

fi
done

