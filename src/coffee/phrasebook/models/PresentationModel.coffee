namespace "phrasebook.models"

class phrasebook.models.PresentationModel extends Backbone.Model 

    defaults: {
        currentlyVisibleOptions: new Backbone.Collection()
        previouslyVisitedOptions: new Backbone.Collection()
    }

    chooseOption: (option) -> 
        @get('previouslyVisitedOptions').push(option)
        @set('currentlyVisibleOptions', new Backbone.Collection(option.get('children')))