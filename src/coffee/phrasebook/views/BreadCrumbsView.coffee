namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View
    
    events: {
      "click a": "onGoBackClick"
    }
    
    render: ->
        ul = $('<ul id="breadcrumbs"></ul>')
        @presentationModel.get('previouslyVisitedOptions').each (option) ->
            if option.get('pictogramURL')
              optionElement = $(
                '<li class="breadcrumb"><a class="option" href="#">' +
                '<img width="200" height="200" src="' + option.get('pictogramURL') + '" />' +
                '</a></li>'
              )
              ul.append(optionElement)
              optionElement.children('a').data({ option: option })
        
        if (!@presentationModel.get('previouslyVisitedOptions').isEmpty())
          ul.append('<a class="backbutton" href="#">Back</a>')
        
        @$el.html(ul)
        return this

    onGoBackClick: (event) ->
      @presentationModel.goBack()
