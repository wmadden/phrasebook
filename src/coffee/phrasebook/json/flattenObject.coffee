namespace 'phrasebook.json'

phrasebook.json.flattenObject = (object) ->
    result = []

    if object?
        for property, value of object
            result.push(property)
            result = result.concat(phrasebook.json.flattenObject(value))

    return result

phrasebook.json.makeNodeHash = (identifierList) ->
    result = {}
    for identifier in identifierList
        result[identifier] = {
            pictogramUrl: "../assets/pictograms/" + identifier + ".jpg",
            name: ""
        }
    return result