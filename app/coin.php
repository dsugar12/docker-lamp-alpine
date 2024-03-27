<?php

function get($uuid, $conn) {
   $sql = "SELECT amount from coin where uuid='".$uuid."'";
   $result = $conn->query($sql);

   $amt = 0;
   if ($result->num_rows > 0) {
	   $row = $result->fetch_assoc();
           $amt = $row['amount'];
   } 
   return $amt;
}

function set($uuid,$amount, $conn) {
   $sql = "SELECT amount from coin where uuid='".$uuid."'";
   $result = $conn->query($sql);

   $amt = 0;
   if ($result->num_rows > 0) {
	   $sql = "update coin set amount=".$amount." where uuid='".$uuid."'";
           $result = $conn->query($sql);
	   return;
   } 
   $sql = "insert into coin values ('".$uuid."',".$amount.")";
   $result = $conn->query($sql);
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
   $result = $conn->query($sql);

   $amt = 0;
   if ($result->num_rows > 0) {
	   $row = $result->fetch_assoc();
           $amt = $row['amount'];
	   $amt = $amt + $amount;
	   $sql = "update coin set amount=".$amt." where uuid='".$uuid."'";
           $result = $conn->query($sql);
	   return;
   } 
   $sql = "insert into coin values ('".$uuid."',".$amount.")";
   $result = $conn->query($sql);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {

$servername = "localhost";
$username = "admin";
$password = "";
$dbname = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

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


$conn->close();
}
?>
