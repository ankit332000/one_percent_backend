
<?php 

try{
    $connection = new PDO('mysql:host=localhost;dbname=onepercent','root','');
    $connection -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "yes connected";
} catch (PDOException $exc) {
    echo $exc -> getMessage();
    die("could not connect");
}

?>