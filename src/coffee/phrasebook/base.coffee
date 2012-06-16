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

    currentOptionsView = new phrasebook.views.CurrentOptionsView()
    
    breadCrumbsView = new phrasebook.views.BreadCrumbsView()
    
    presentationModel = new phrasebook.models.PresentationModel()

    currentOptionsView.presentationModel = presentationModel
    currentOptionsView.setElement( $("#CurrentOptionsView") )
    currentOptionsView.delegateEvents()
    presentationModel.on('change', currentOptionsView.render, currentOptionsView)

    breadCrumbsView.presentationModel = presentationModel
    breadCrumbsView.setElement( $("#BreadCrumbsView") )
    breadCrumbsView.delegateEvents()
    presentationModel.on('change', breadCrumbsView.render, breadCrumbsView)

    presentationModel.set('currentlyVisibleOptions', new Backbone.Collection(options))
)