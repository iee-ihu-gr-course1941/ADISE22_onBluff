<?php
function show_game_board(){
    global $mysqli;

        $sql = 'select * from game_board';
        $st = $mysqli->prepare($sql);

        $st->execute();
        $res = $st->get_result();

        header('Content-type: application/json');
        print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_game_board(){
    global $mysqli;

    $sql = 'call clean_board()';
    $mysqli->query($sql);
    show_game_board();
}

function show_hands(){
    global $mysqli;

        $sql = 'select * from hands';
        $st = $mysqli->prepare($sql);

        $st->execute();
        $res = $st->get_result();

        header('Content-type: application/json');
        print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

?>