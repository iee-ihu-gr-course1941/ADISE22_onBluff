<?php

function handle_cards($method, $b, $input){
    if($method=='GET'){    
        show_hands($b);
    } else if ($method=='POST'){
        share_cards();        
    }else{
        header('HTTP/1.1405 Method Not Allowed');
    }
}


function show_hands($b){
    global $mysqli;

        $sql = 'select * from hands where turn_name=?';
        $st = $mysqli->prepare($sql);
        $st->bind_param('s',$b);
        $st->execute();
        $res = $st->get_result();
        header('Content-type: application/json');
        print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function share_cards(){
    global $mysqli;
    $sql = 'call share_1st_player';
    $mysqli->query($sql);
}
?>




