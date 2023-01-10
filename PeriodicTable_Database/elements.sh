#!/bin/bash

PSQL="psql --username=postgres --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^[0-9] ]]
  then
    NUMBER_RESULT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number=$1")
    NUMBER_RESULT_2=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties WHERE atomic_number=$1")
    if [[ -z $NUMBER_RESULT ]]
    then
      echo I could not find that element in the database.
    else
      type=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$1")
      if [[ $type == 1 ]]
      then
      TYPE="nonmetal"
      else
      if [[ $type == 2 ]]
      then
      TYPE="metal"
      else
      if [[ $type == 3 ]]
      then
      TYPE="metalloid"
      fi
      fi
      fi
      echo "$NUMBER_RESULT|$NUMBER_RESULT_2" | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done

    fi
    else

    if [[ $1 =~ ^[A-Z][a-z]$ || $1 =~ ^[A-Z]$ ]]
    then
    RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    if [[ -z $RESULT ]]
    then
      echo I could not find that element in the database.
    else
      type=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$RESULT")
      if [[ $type == 1 ]]
      then
      TYPE="nonmetal"
      else
      if [[ $type == 2 ]]
      then
      TYPE="metal"
      else
      if [[ $type == 3 ]]
      then
      TYPE="metalloid"
      fi
      fi
      fi
      NUMBER_RESULT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number=$RESULT ")
      NUMBER_RESULT_2=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties WHERE atomic_number=$RESULT ")
      echo "$NUMBER_RESULT|$NUMBER_RESULT_2" | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    fi
    else

    if [[ $1 =~ ^[A-Z][a-z]+ ]]
    then
    RESULT=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    if [[ -z $RESULT ]]
    then
      echo I could not find that element in the database.
    else
      type=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$RESULT")
      if [[ $type == 1 ]]
      then
      TYPE="nonmetal"
      else
      if [[ $type == 2 ]]
      then
      TYPE="metal"
      else
      if [[ $type == 3 ]]
      then
      TYPE="metalloid"
      fi
      fi
      fi
      NUMBER_RESULT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number=$RESULT ")
      NUMBER_RESULT_2=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties WHERE atomic_number=$RESULT")
      echo "$NUMBER_RESULT|$NUMBER_RESULT_2" | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
      
    fi
    else
    echo I could not find that element in the database.
    fi

  fi
  fi
fi
