<?php

function get($uuid, $conn) {
   $sql = "SELECT wins from wrestlers where uuid='".$uuid."'";
   $result = pg_query($sql) or die('Query failed: ' . pg_last_error());

   $amt = 0;
   if ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
           $amt = $line['wins'];
   } 
   return $amt;
}

function set($uuid,$wins, $conn) {
   $sql = "SELECT wins from wrestlers where uuid='".$uuid."'";
   $result = pg_query($sql) or die('Query failed: ' . pg_last_error());

   $amt = 0;
   if ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
	   $sql = "update wrestlers set wins=".$wins." where uuid='".$uuid."'";
           $result = pg_query($sql) or die('Upddate failed: ' . pg_last_error());
	   return;
   } 
   $sql = "insert into wrestlers values ('".$uuid."',".$wins.")";
   $result = pg_query($sql) or die('Insert failed: ' . pg_last_error());
}

function multiadd($inputArray, $conn)
{
   for ($i=1; $i<count($inputArray); $i+=2)
   {
      add($inputArray[$i],$inputArray[$i+1],$conn);
   }
}

function add($uuid,$wins, $conn) {
   $sql = "SELECT wins from wrestlers where uuid='".$uuid."'";
   $result = pg_query($sql) or die('Query failed: ' . pg_last_error());

   $amt = 0;
   if ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
           $amt = $line['wins'];
	   $amt = $amt + $wins;
	   $sql = "update wrestlers set wins=".$amt." where uuid='".$uuid."'";
           $result = pg_query($sql) or die('Update failed: ' . pg_last_error());
	   return;
   } 
   $sql = "insert into wrestlers values ('".$uuid."',".$wins.")";
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
   echo $uuid.":WRESTLER:".$ret;
   return;
}

list($uuid, $command, $wins) = explode(":", $string);
if ($command=="ADD")
{
    add($uuid,$wins,$conn);
    echo $uuid.":ADDED";
    return;
}

if ($command=="SET")
{
    set($uuid,$wins,$conn);
    echo $uuid.":SETTED";
    return;
}


pg_close($conn);
}
?>
