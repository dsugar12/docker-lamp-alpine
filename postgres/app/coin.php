<?php

function get($uuid, $conn) {
   $sql = "SELECT amount from coin where uuid='".$uuid."'";
   $result = pg_query($sql) or die('Query failed: ' . pg_last_error());

   $amt = 0;
   if ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
           $amt = $line['amount'];
   } 
   return $amt;
}

function set($uuid,$amount, $conn) {
   $sql = "SELECT amount from coin where uuid='".$uuid."'";
   $result = pg_query($sql) or die('Query failed: ' . pg_last_error());

   $amt = 0;
   if ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
	   $sql = "update coin set amount=".$amount." where uuid='".$uuid."'";
           $result = pg_query($sql) or die('Upddate failed: ' . pg_last_error());
	   return;
   } 
   $sql = "insert into coin values ('".$uuid."',".$amount.")";
   $result = pg_query($sql) or die('Insert failed: ' . pg_last_error());
}

function multiadd($inputArray, $conn)
{
   for ($i=1; $i<count($inputArray); $i+=2)
   {
      add($inputArray[$i],$inputArray[$i+1],$conn);
   }
}

function add($uuid,$amount, $conn) {
   $sql = "SELECT amount from coin where uuid='".$uuid."'";
   $result = pg_query($sql) or die('Query failed: ' . pg_last_error());

   $amt = 0;
   if ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
           $amt = $line['amount'];
	   $amt = $amt + $amount;
	   $sql = "update coin set amount=".$amt." where uuid='".$uuid."'";
           $result = pg_query($sql) or die('Update failed: ' . pg_last_error());
	   return;
   } 
   $sql = "insert into coin values ('".$uuid."',".$amount.")";
   $result = pg_query($sql) or die('Insert failed: ' . pg_last_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {

$servername = "localhost";
$username = "postgres";
$password = "";
$dbname = "test";

// Create connection
$conn = pg_connect("host=$servername dbname=$dbname user=$username password=$password")
    or die('Could not connect: ' . pg_last_error());
// Check connection

$string = file_get_contents('php://input');
//ADD:UUID:20
list($uuid, $command) = explode(":", $string);

if ($uuid=="MULTIADD")
{
    $arr = explode(":",$string);
    multiadd($arr,$conn);
    echo "MULTIADDED";
    return;
}

if ($command=="GET")
{
   $ret = get($uuid,$conn);
   echo $uuid.":BALANCE:".$ret;
   return;
}

list($uuid, $command, $amount) = explode(":", $string);
if ($command=="ADD")
{
    add($uuid,$amount,$conn);
    echo $uuid.":ADDED";
    return;
}

if ($command=="SET")
{
    set($uuid,$amount,$conn);
    echo $uuid.":SETTED";
    return;
}


pg_close($conn);
}
?>
