<?php

function multiadd($inputArray)
{
   for ($i=1; $i<count($inputArray); $i+=2)
   {
      add($inputArray[$i],$inputArray[$i+1]);
   }
}

function add($uuid,$amount) {
	echo "now adding ".$uuid." ".$amount."\n" ;
}

$string = "MULTIADD:UUID1:200:UUID2:300:UUID3:350";
//ADD:UUID:20
list($uuid, $command) = explode(":", $string);

if ($uuid=="MULTIADD")
{
    $arr = explode(":",$string);
    multiadd($arr);
    echo "MULTIADDED";
    return;
}

?>
