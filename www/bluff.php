<?php
 require_once "../lib/dbconnect.php";
 require_once "../lib/game_board.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
//$request = explode('/', trim($_SERVER['SCRIPT_NAME'],'/'));
// Σε περίπτωση που τρέχουμε php -S
$input = json_decode(file_get_contents('php://input'),true);


switch ($r=array_shift($request)) {
    case 'game_board' :
        switch ($b=array_shift($request)){
    case '':
        case null: handle_board($method);break;
        case 'piece': handle_piece($method, $request[0],$request[1],$input);
                                    break;
        case 'player': handle_player($method, $request[0],$input);
                                    break;
        default: header("HTTP/1.1 404 Not Found");
                                    break;
}
break;
    case 'hands' :
        switch ($b=array_shift($request)){
    case '':
        case null: handle_hands($method);break;
        case 'piece': //handle_piece($method, $request[0],$request[1],$input);
                                    break;
        case 'player': //handle_player($method, $request[0],$input);
                                    break;
        default: header("HTTP/1.1 404 Not Found");
                                    break;
    }
break;
default:
    header("HTTP/1.1 404 Not Found");
    exit;
}




function handle_board($method){
    if($method=='GET'){
        show_game_board();
    } else if ($method=='POST'){
        reset_game_board();
    } else {
        header('HTTP/1.1405 Method Not Allowed');
    }
}

function handle_hands($method){
    if($method=='GET'){
        show_hands();
    } else {
        header('HTTP/1.1405 Method Not Allowed');
    }
}

function handle_piece($method, $x,$y,$input){
    ;
}

function handle_player($method, $p,$input){
    ;
}

function handle_status($method){
    if($method == 'GET'){
        show_status();
    } else {
        header('HTTP/1.1405 Method Not Allowed');
    }
}


?>