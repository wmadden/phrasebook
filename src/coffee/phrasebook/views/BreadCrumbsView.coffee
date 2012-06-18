namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View

    render: ->
        ul = $('<ul id="options"></ul>')
        @presentationModel.get('previouslyVisitedOptions').each (option) ->
            if(option.get('pictogramURL') != null)
              optionElement = $('<li><a class="option" href="#">' +
                                  '<img width="200" height="200" src="' + option.get('pictogramURL') + '" />' +
                                '</a></li>')
              ul.append(optionElement)
              optionElement.children('a').data({ option: option })
        @$el.html(ul)
        return this
