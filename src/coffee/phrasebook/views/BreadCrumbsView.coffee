namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View

    events: {
        "click .delete": "onGoBackClick"
    }

    render: ->
        ul = $('<ul id="breadcrumbs"></ul>')
        @presentationModel.get('previouslyVisitedOptions').each (option) =>
            optionHTML = '<li class="breadcrumb">';

            if option.get('pictogramURL')?
                optionHTML += '<img width="200" height="200" src="' + option.get('pictogramURL') + '" />';

            optionHTML += '<span class="label">' + option.get('name') + '</span>';

            if option == @presentationModel.get('previouslyVisitedOptions').last()
                optionHTML += '<a href="#" class="delete">Delete</a>';

            optionHTML += '</li>'

            optionElement = $(optionHTML)

            ul.append(optionElement)
            optionElement.children('a').data({ option: option })

        @$el.html(ul)
        return this

    onGoBackClick: (event) ->
        @presentationModel.goBack()
