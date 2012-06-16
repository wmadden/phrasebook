$(->
    
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

    view = new phrasebook.views.CurrentOptionsView()
    view.setElement( $("#CurrentOptionsView") )
    view.options = options
    view.render()
    view.delegateEvents()

)