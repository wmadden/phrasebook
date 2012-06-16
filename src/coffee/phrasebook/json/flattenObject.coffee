namespace 'phrasebook.json'

phrasebook.json.flattenObject = (object) ->
    result = []

    if object?
        for property, value of object
            result.push(property)
            result = result.concat(phrasebook.json.flattenObject(value))

    return result