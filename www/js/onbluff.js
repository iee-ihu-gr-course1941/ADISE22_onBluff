var me = {};
var game_status={};
$(function(){
    $('#bluff_start').click(login_to_game);

})



    function login_to_game() {
        if($('#username').val()=='') {
        alert('You have to set a username');
        return;
        }

        var t_name = $('#turn_name').val();
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
        //game_status_update();
    }

    function update_info(){
        $('#game_info').html("I am Player: "+me.turn_name +", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
    }

    function login_error(data,y,z,c){
        var x = data.responseJSON;
        // alert(x.errormesg);
    }
