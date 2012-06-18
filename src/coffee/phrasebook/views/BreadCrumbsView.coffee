namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View

    render: ->
        ul = $('<ul id="options"></ul>')
        @presentationModel.get('previouslyVisitedOptions').each (option) ->
            if option.get('pictogramURL')
              optionElement = $('<li><a class="option" href="#">' +
                                  '<img width="200" height="200" src="' + option.get('pictogramURL') + '" />' +
                                '</a></li>')
              ul.append(optionElement)
              optionElement.children('a').data({ option: option })
        
        if (!@presentationModel.get('previouslyVisitedOptions').isEmpty())
          ul.append('<a href="#">Back</a>')
        
        @$el.html(ul)
        return this
