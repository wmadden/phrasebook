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
              optionElement = $('<li><button type="button" class="option">' + option.get('name') + '</button></li>')
              options.append(optionElement)
              optionElement.children('button').data({ option: option })
          @$el.html(options)

        return this
        
    onOptionClick: (event) ->
        @presentationModel.chooseOption($(event.target).data().option)
#        window.location.hash="CurrentOptionsView";
#        window.location.hash=null;
