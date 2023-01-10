#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

SERVICES(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
  services=$($PSQL "SELECT * FROM services")
  echo "$services" | while IFS="|" read service_id service_name
  do
  echo -e "\n$service_id) $service_name"
  done
  echo -e "\nChoose your service:"
  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id="$SERVICE_ID_SELECTED"")

  if [[ -z $SERVICE ]]
  then
  SERVICES "SERVICE NOT FOUND ENTER A VALID SERVICE"
  fi
}
USER_AUTHENTICATION(){
  echo -e "\nSo you would like to $($PSQL "SELECT name FROM services WHERE service_id=$SERVICE") your hair."
  echo -e "\nIn order to help book your appointment enter your number please:"
  read CUSTOMER_PHONE
  phoneIsAvailable=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $phoneIsAvailable ]]
  then
  echo -e "\nPlease enter your name:"
  read CUSTOMER_NAME
  echo -e "\nPlease a suitable appointment time:"
  read SERVICE_TIME
  $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
  customer_id=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($customer_id ,$SERVICE, '$SERVICE_TIME')"
  echo -e "Welcome $CUSTOMER_NAME have a nice visit."
  echo -e "\nI have put you down for a $(echo $($PSQL "SELECT name FROM services WHERE service_id=$SERVICE") | tr '[:upper:]' '[:lower:]') at $SERVICE_TIME, $CUSTOMER_NAME."
  else
  echo -e "Welcome back $phoneIsAvailable"
  echo -e "\nPlease a suitable appointment time:"
  read SERVICE_TIME
  customer_id=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nI have put you down for a $($PSQL "SELECT name FROM services WHERE service_id=$SERVICE") at $SERVICE_TIME, $phoneIsAvailable."
  fi
  
}

SERVICES
USER_AUTHENTICATION
