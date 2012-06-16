namespace "phrasebook.models"

class phrasebook.models.PresentationModel extends Backbone.Model 

    initialize: ->
        @tree = @parseJSONTree(phrasebook.json.tree)

        @set('currentlyVisibleOptions', new Backbone.Collection(_.values(@tree)))
        @set('previouslyVisitedOptions', new Backbone.Collection())

    chooseOption: (option) ->
        @get('previouslyVisitedOptions').push(option)
        @set('currentlyVisibleOptions', new Backbone.Collection(option.get('children')))

    parseJSONTree: (tree) ->
        for nodeID, children of tree
            baseNode = phrasebook.json.nodes[nodeID] || {}
            node = _.clone(baseNode)
            _.extend(node, {
                children: @parseJSONTree(children)
            })