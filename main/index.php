<?php
require_once "../lib/dbconnect.php";


echo "This line from php....";

$sql = "select * from players";

$st = $mysqli->prepare($sql);

$st->execute();
$res = $st->get_result();

$r = $res->fetch_assoc();
print "username: $r[username], card_id: $r[card_id]";
?>

    
