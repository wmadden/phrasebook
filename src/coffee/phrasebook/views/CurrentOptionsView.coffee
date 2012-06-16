namespace "phrasebook.views"

class phrasebook.views.CurrentOptionsView extends Backbone.View

    events: {
        "click a.option": "onOptionClick"
    }

    render: ->
        ul = $('<ul id="options"></ul>')
        for option in @options
            optionElement = $('<li><a class="option" href="#">' + option.text + '</a></li>')
            ul.append(optionElement)
            optionElement.children('a').data({ option: option })
        @$el.html(ul)
        return this

    onOptionClick: (event) ->
        @options = $(event.target).data().option.children || []
        @render()
