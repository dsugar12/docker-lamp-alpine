<?php

/*function get($uuid, $conn) {
   $sql = "SELECT amount from coin where uuid='".$uuid."'";
   $result = $conn->query($sql);

   $amt = 0;
   if ($result->num_rows > 0) {
           $row = $result->fetch_assoc();
           $amt = $row['amount'];
   } 
   return $amt;
}*/

function add($uuid,$product, $conn) {
   $sql = "insert into sales (uuid, product, sale_date) values ('".$uuid."','".$product."',now())";
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
//UUID:ADD:PRODUCT
list($uuid, $command, $product) = explode(":", $string);
if ($command=="ADD")
{
    add($uuid,$product,$conn);
    echo $uuid.":SALE ADDED";
    return;
}

$conn->close();
}
?>

