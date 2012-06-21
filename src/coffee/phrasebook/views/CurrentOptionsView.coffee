namespace "phrasebook.views"

class phrasebook.views.CurrentOptionsView extends Backbone.View

    events: {
        "change select": "onOptionChange"
    }

    render: ->
        if (@presentationModel.get('currentlyVisibleOptions').isEmpty())
          @$el.html("")
        else
          select = $('<select class="options"></select>')
          select.append('<option class="option" selected="selected">Say...</option>')
          @presentationModel.get('currentlyVisibleOptions').each (option) ->
              optionElement = $('<option class="option">' + option.get('name') + '</option>')
              select.append(optionElement)
              optionElement.data({ option: option })
          @$el.html(select)
        
        return this
        
    onOptionChange: (event) ->
        @presentationModel.chooseOption($(event.target).children("option[selected=selected]").data().option)
