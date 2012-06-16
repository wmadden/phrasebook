namespace "phrasebook.views"

class phrasebook.views.CurrentOptionsView extends Backbone.View

    events: {
        "click a.option": "onOptionClick"
    }

    render: ->
        ul = $('<ul id="options"></ul>')
        @presentationModel.get('currentlyVisibleOptions').each (option) ->
            optionElement = $('<li><a class="option" href="#">' + option.get('name') + '</a></li>')
            ul.append(optionElement)
            optionElement.children('a').data({ option: option })
        @$el.html(ul)
        return this

    onOptionClick: (event) ->
        @presentationModel.chooseOption($(event.target).data().option)
