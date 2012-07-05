namespace "phrasebook.views"

class phrasebook.views.BreadCrumbsView extends Backbone.View

    events: {
        "click .delete": "onGoBackClick"
    }

    render: ->
        ul = $('<ul id="breadcrumbs"></ul>')
        lastElement = null
        textonly = false

        @presentationModel.get('previouslyVisitedOptions').each (option) =>
            breadcrumbClass = 'breadcrumb';

            textonly = not option.get('pictogramURL')?
            if textonly
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

        if( lastElement && @getNumberOfBreadcrumbs() > @previousNumberOfBreadcrumbs )
            expectedHeight = if textonly
                                '40px'
                             else
                                '200px'
            lastElement
                .css('opacity', 0)
                .css('height', 0)
                .animate({ height: expectedHeight}, 'fast', 'swing', ->
                    $(this).animate({ opacity: '1.0'}, 'fast', ->
#                        window.location.hash = null
#                        window.location.hash = "CurrentOptionsView"
                        $('html, body').animate({
                            scrollTop: $('#CurrentOptionsView').offset().top
                        }, 1000);
                    )
                )


        @previousNumberOfBreadcrumbs = @getNumberOfBreadcrumbs()

        return this

    getNumberOfBreadcrumbs: ->
        @presentationModel.get('previouslyVisitedOptions').length

    onGoBackClick: (event) ->
        @presentationModel.goBack()
