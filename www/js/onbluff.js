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
        game_status_update1st();
    }

    function hands_result(data) {
 
        for (var i = 0; i < data.length; i++){
            my_cards[i] = data[i];
        }
        $('#my_hand').show();
        reveal_cards();
         update_info();
    }

    // function reveal_cards(){
    //     for (var j = 1; j < my_cards.length; j++){
    //         $('#my_hand').append('<img width="100" height="150" src= "'+my_cards[j].img+'"/>');
    //     }
       
    // }

    function reveal_cards() {
        var html = "";
        for (var j = 0; j <= my_cards.length; j++){
            html += '<img width="100" height="150" src= "'+my_cards[j].img+'"/>';
        }
        $('#my_hand').html(html);
    }
   

    function update_info(){
        $('#game_info').html("I am Player: "+me.turn_name +", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
    }

    function game_status_update1st(){
        $.ajax({url: "bluff.php/status/", success: update_status1st});
    }

    function game_status_update(){
        $.ajax({url: "bluff.php/status/", success: update_status});
    }

    function update_status1st(data) {
        last_update=new Date().getTime();
        var game_stat_old = game_status;
        game_status=data[0];
        update_info();
        clearTimeout(timer);
        if (game_status.status == "started"){

            $.ajax({url:"bluff.php/hands/"+t_name,
            method: 'POST',
            success: update_status(data),
             error: all_fucked});
            

        } else if (game_status.status == "initialized"){
            timer=setTimeout(function() { game_status_update();}, 4000);
        }
    }

        function update_status(data) {
            last_update=new Date().getTime();
            var game_stat_old = game_status;
            game_status=data[0];
            update_info();
            clearTimeout(timer);

            if(game_status.p_turn==me.turn_name &&  me.turn_name!=null) {
                x=0;
                // do play
                if(game_stat_old.p_turn!=game_status.p_turn) {
                    // fill_board();
                }
                // $('#move_div').show(1000);
                 timer=setTimeout(function() { game_status_update();}, 15000);
                 timer=setTimeout(function() { get_hands();}, 15000);
            } else {
                // must wait for something
                // $('#move_div').hide(1000);
                timer=setTimeout(function() { game_status_update();}, 4000);
                timer=setTimeout(function() { get_hands();}, 4000);
            }


        }

        
            function get_hands(data) {
                $.ajax({url: "bluff.php/hands/"+t_name,
                method: 'GET',
                dataType: "json",
                contentType: 'application/json',
                data: JSON.stringify( {turn_name: t_name}),
                 success: hands_result,
                 error: login_error});
            }

        

        
         
    

    

    function all_good() {
        // alert("All good");
    }

    function all_fucked() {
        alert("All fucked");
    }

    function login_error(data,y,z,c){
        var x = data.responseJSON;
        // alert(x.errormesg);
    }

