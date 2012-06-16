$(->
    
    renderOptions = (options) ->
        for option in options
            optionElement = $('<li><a class="option" href="#">' + option.text + '</a></li>')
            $('#options').append(optionElement)
            optionElement.children('a').data({ option: option })

    clearOptions = ->
        $("#options").empty()

    onOptionClick = (event) ->
        options = $(event.target).data().option.children || []
        clearOptions()
        renderOptions(options)

    options = [
            {
                text: "where?",
                children: [
                    {
                        text: "restaurant"
                    },
                    {
                        text: "brothel"
                    }
                ]
            },  
            {
                text: "when?",
                children: [
                    {
                        text: "today"
                    },
                    {
                        text: "tomorrow"
                    }
                ]
            }
        ]

    renderOptions(options)

    $('.option').live('click', onOptionClick )
)