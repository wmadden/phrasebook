$(->
    
    options = ["where?", "when?"]

    for text in options
        $('#options').append($('<li><a href="#">' + text + '</a></li>'))

)