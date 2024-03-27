<?php

function get($uuid, $conn) {
   $sql = "SELECT wins from wrestlers where uuid='".$uuid."'";
   $result = $conn->query($sql);

   $amt = -5;
   if ($result->num_rows > 0) {
	   $row = $result->fetch_assoc();
           $amt = $row['wins'];
   } 
   return $amt;
}

function set($uuid,$wins, $conn) {
   $sql = "SELECT wins from wrestlers where uuid='".$uuid."'";
   $result = $conn->query($sql);

   $amt = 0;
   if ($result->num_rows > 0) {
	   $sql = "update wrestlers set wins=".$wins." where uuid='".$uuid."'";
           $result = $conn->query($sql);
	   return;
   } 
   $sql = "insert into wrestlers values ('".$uuid."',".$wins.")";
   $result = $conn->query($sql);
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
   $result = $conn->query($sql);

   $amt = 0;
   if ($result->num_rows > 0) {
	   $row = $result->fetch_assoc();
           $amt = $row['wins'];
	   $amt = $amt + $wins;
	   $sql = "update wrestlers set wins=".$amt." where uuid='".$uuid."'";
           $result = $conn->query($sql);
	   return;
   } 
   $sql = "insert into wrestlers values ('".$uuid."',".$wins.")";
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


$conn->close();
}
?>
