if(document.getElementById("cart-button-continue1") && document.getElementsByClassName("order-item").length === 0){
    document.getElementById("cart-button-continue1").disabled=true;
}

$('#cart-button-continue1').on('click', function(){
    $.ajax({ type: "GET",
        url: '/address/new',
        data: { }
    }).done(function(data) {
        console.log(data);
    });
});

$('#cart-button-continue2').on('click', function(){
    sendData = getAddressValues('delivery');
    console.log(sendData);goog
    $.ajax({ type: "GET",
        url: '/addresses',
        data: sendData
    }).done(function(data) {
        console.log(data);
    });
});

$('#cart-button-cancel2').on('click', function(){
    $('#cart-main-div').html("<%=escape_javascript render(:partial => 'shoeList') %>");
    $('#cart-buttons-2').hide();
    $('#cart-buttons-1').show();
    $('#cart-progress-bar').css('width', '25%');
});



$('#cart-button-cancel3').on('click', function(){
    debuger;
    $.ajax({ type: "GET",
        url: '/address/new',
        data: { }
    }).done(function(data) {
        console.log(data);
    });
    $("cart-buttons-3").html("");
    $('#cart-buttons-3').hide();
    $('#cart-buttons-2').show();
});

function getAddressValues(type) {
    name_text = document.getElementById('name'+type).value;

    return {name: name_text};
}