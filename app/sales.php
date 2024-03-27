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

