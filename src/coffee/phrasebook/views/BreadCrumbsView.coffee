namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View

    render: ->
        ul = $('<ul id="options"></ul>')
        @presentationModel.get('previouslyVisitedOptions').each (option) ->
            optionElement = $('<li><a class="option" href="#">' + option.get('text') + '</a></li>')
            ul.append(optionElement)
            optionElement.children('a').data({ option: option })
        @$el.html(ul)
        return this
