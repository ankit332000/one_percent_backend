<?php

require('connection.php');
$makeQuery = "SELECT * FROM html2";

$statement = $connection -> prepare($makeQuery);
$statement -> execute();
$myarray = array();

while($resultFrom = $statement -> fetch()) {

array_push(
    $myarray,array(
        "id" => $resultFrom['id'],
        "heading" => $resultFrom['heading'],
        "body" => $resultFrom['body'],
        "prev" => $resultFrom['prev'],
        "next" => $resultFrom['next']
    )
);

}

echo json_encode($myarray);

?>
