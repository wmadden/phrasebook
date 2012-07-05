namespace "phrasebook.views"

class phrasebook.views.CurrentOptionsView extends Backbone.View

    events: {
        "click .option": "onOptionClick"
    }

    render: ->
        if (@presentationModel.get('currentlyVisibleOptions').isEmpty())
          @$el.html("")
        else
          options = $('<ul id="options"></ul>')
          @presentationModel.get('currentlyVisibleOptions').each (option) ->
              optionElement = $('<li><a class="option btn" href="#">' + option.get('name') + '</a></li>')
              options.append(optionElement)
              optionElement.children('a').data({ option: option })
          @$el.html(options)

        return this
        
    onOptionClick: (event) ->
        @presentationModel.chooseOption($(event.target).data().option)
