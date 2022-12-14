<?php
 require_once "../lib/dbconnect.php";
 require_once "../lib/game_board.php";
 require_once "../lib/game.php";
 require_once "../lib/users.php";
 require_once "../lib/hands.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
//$request = explode('/', trim($_SERVER['SCRIPT_NAME'],'/'));
// Σε περίπτωση που τρέχουμε php -S
$input = json_decode(file_get_contents('php://input'),true);


switch ($r=array_shift($request)) {
    case 'game_board' :
    switch ($b=array_shift($request)){
        case '':
        case null: handle_board($method);
        break;
        case 'card': handle_card($method, $request[0],$request[1]);
                    break;
        case 'bluff': handle_bluff($method, $request[0]);
                    break;
        default: header("HTTP/1.1 404 Not Found");
                    break;

    }
            break;
     case 'status':
        if (sizeof($request)==0) {handle_status($method);}
        else {header("HTTP/1.1 404 Not Found");}
        break;
    case 'hands' : handle_hands($method, $request, $input);
    break;        
    case 'players': handle_player($method, $request, $input);
    break;   
        default: header("HTTP/1.1 404 Not Found");
                                    break;
                                 
}
        
    exit;






function handle_board($method){
    if($method=='GET'){
        show_game_board();
    } else if ($method=='POST'){
        reset_game_board();
    } else {
        header('HTTP/1.1405 Method Not Allowed');
    }
}

function handle_hands($method, $c, $input){
    switch ($b=array_shift($c)){
        case "A":
        case "B": handle_cards($method, $b, $input);
            break;
            default: header("HTTP/1,1 404 Not Found");
            print json_encode(['errormesg' => "Something's wrong"]);
            break;
            show_hands($c);
    }
}


function handle_card($method, $name,$c){
    if ($method=='PUT'){
        throw_card($name,$c);
    } else if ($method=='GET'){

    }
    ;
}

function handle_bluff($method, $uname){
    if ($method=='PUT'){
        take_back($uname);
    } else if ($method=='GET'){

    }
    ;
}

function handle_player($method, $p,$input){
    switch ($b=array_shift($p)){
        case "A":
        case "B": handle_user($method, $b, $input);
            break;
        default: header("HTTP/1,1 404 Not Found");
            print json_encode(['errormesg' => "Player $b not found."]);
            break;

    }
}

function handle_status($method){
    if($method == 'GET'){
        show_game_status();
    } else {
        header('HTTP/1.1405 Method Not Allowed');
    }
}


?>