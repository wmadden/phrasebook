namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View

    events: {
        "click .delete": "onGoBackClick"
    }

    render: ->
        ul = $('<ul id="breadcrumbs"></ul>')
        lastElement = null

        @presentationModel.get('previouslyVisitedOptions').each (option) =>
            breadcrumbClass = 'breadcrumb';

            if not option.get('pictogramURL')?
                breadcrumbClass += ' text-only';

            optionHTML = '<li class="' + breadcrumbClass + '"><div class="content">';

            if option.get('pictogramURL')?
                optionHTML += '<img width="200" height="200" src="' + option.get('pictogramURL') + '" />';

            optionHTML += '<span class="label">' + option.get('name') + '</span>';

            if option == @presentationModel.get('previouslyVisitedOptions').last()
                optionHTML += '<a href="#CurrentOptionsView" class="delete">Delete</a>';

            optionHTML += '</div></li>'

            optionElement = $(optionHTML)

            lastElement = optionElement

            ul.append(optionElement)

        @$el.html(ul)

        if( lastElement )
            lastElement
                .css('opacity', 0)
                .animate({ width: '200px', height: '200px'}, 'slow')
                .animate({ opacity: '1.0'}, 'slow')


        return this

    onGoBackClick: (event) ->
        @presentationModel.goBack()
