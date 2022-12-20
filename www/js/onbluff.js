var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;
var t_name = null;
var my_cards={};

$(function(){
    $('#bluff_start').click(login_to_game);

})


    function login_to_game() {
        if($('#username').val()=='') {
        alert('You have to set a username');
        return;
        }

        t_name = $('#turn_name').val();
        if (t_name == "Choose your side"){
            alert('You have to choose one side');
        return;
        } else {
            $.ajax({url: "bluff.php/players/"+t_name,
                method: 'PUT',
                dataType: "json",
                contentType: 'application/json',
                data: JSON.stringify( {username:$('#username').val(),
                turn_name: t_name}),
                 success: login_result,
                 error: login_error});
                



                // reset_game_board()

        }
    } 

    function login_result(data) {
        
        me = data[0];
        $('#game_initializer').hide();
        $('#game_on').show();
         update_info();
        game_status_update();
    }

    function hands_result(data) {
        for (var i = 0; i < data.length; i++){
            my_cards[i] = data[i];
        }
        $('#my_hand').show();
        reveal_cards();
         update_info();
    }

    function reveal_cards(){
        $('#my_hand').html("I have: "+my_cards[1].suit_symbol);
    }

    function update_info(){
        $('#game_info').html("I am Player: "+me.turn_name +", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
    }

    function game_status_update(){
        $.ajax({url: "bluff.php/status/", success: update_status});
    }

    function update_status(data) {
        last_update=new Date().getTime();
        var game_stat_old = game_status;
        game_status=data[0];
        update_info();
        clearTimeout(timer);
        if (game_status.status == "started"){

            $.ajax({url:"bluff.php/hands/"+t_name,
            method: 'POST',
            success: all_good,
             error: all_fucked});
            


            $.ajax({url: "bluff.php/hands/"+t_name,
            method: 'GET',
            dataType: "json",
            contentType: 'application/json',
            data: JSON.stringify( {turn_name: t_name}),
             success: hands_result,
             error: login_error});

        }

        

        
        // if(game_status.p_turn==me.piece_color &&  me.piece_color!=null) {
        //     x=0;
        //     // do play
        //     if(game_stat_old.p_turn!=game_status.p_turn) {
        //         fill_board();
        //     }
        //     $('#move_div').show(1000);
            //  timer=setTimeout(function() { game_status_update();}, 15000);
        // } else {
        //     // must wait for something
        //     $('#move_div').hide(1000);
        //     timer=setTimeout(function() { game_status_update();}, 4000);
        // }
         
    }

    

    function all_good() {
        alert("All good");
    }

    function all_fucked() {
        alert("All fucked");
    }

    function login_error(data,y,z,c){
        var x = data.responseJSON;
        // alert(x.errormesg);
    }

