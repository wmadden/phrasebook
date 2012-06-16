$(->
    
    currentOptionsView = new phrasebook.views.CurrentOptionsView()
    
    breadCrumbsView = new phrasebook.views.BreadCrumbsView()
    
    presentationModel = new phrasebook.models.PresentationModel()

    currentOptionsView.presentationModel = presentationModel
    currentOptionsView.setElement( $("#CurrentOptionsView") )
    currentOptionsView.delegateEvents()
    currentOptionsView.render()
    presentationModel.on('change', currentOptionsView.render, currentOptionsView)

    breadCrumbsView.presentationModel = presentationModel
    breadCrumbsView.setElement( $("#BreadCrumbsView") )
    breadCrumbsView.delegateEvents()
    breadCrumbsView.render()
    presentationModel.on('change', breadCrumbsView.render, breadCrumbsView)
)