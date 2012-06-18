namespace "phrasebook.views"

class phrasebook.views.CurrentOptionsView extends Backbone.View

    events: {
        "change select": "onOptionChange"
        "click a": "onGoBack"
    }

    render: ->
        if (@presentationModel.get('currentlyVisibleOptions').isEmpty())
          @$el.html("")
        else
          select = $('<select id="options"></select>')
          select.append('<option class="option" selected="selected"></option>')
          @presentationModel.get('currentlyVisibleOptions').each (option) ->
              optionElement = $('<option class="option">' + option.get('name') + '</option>')
              select.append(optionElement)
              optionElement.data({ option: option })
          @$el.html(select)
          if (!@presentationModel.get('previouslyVisitedOptions').isEmpty())
            @$el.append('<a href="#"> Back</a>')
        return this
        
    onOptionChange: (event) ->
        @presentationModel.chooseOption($(event.target).children("option[selected=selected]").data().option)

    onGoBack: (event) ->
        @presentationModel.goBack()
