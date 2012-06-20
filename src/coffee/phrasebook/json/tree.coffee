namespace 'phrasebook.json'

services = {
    pharmacy: null,
    hospital: null,
    police: null,
    doctor: null,
    bathroom: null,
    kitchen: null
}

open_close = {
    restaurant: null,
    bar: null,
    tourist_attraction: null,
    hotel_room: null,
    pharmacy: null
}

modes_of_transport = {
    taxi: null,
    train: null,
    bus: null,
    boat: null,
    person: null
}

adjectives = {
    good: null,
    dangerous: null,
    hot: null,
    cold: null,
    far: null,
    expensive: null,
    broken: null
}

consumables = {
    food: null,
    water: null
}

phrasebook.json.tree = {
    questions: {
        when: {
            arrives: modes_of_transport,
            departs: modes_of_transport,
            open: open_close,
            close: open_close,
            check_in: null,
            check_out: null
        },
        how_do_I_get_to: {
            transport: modes_of_transport,
            entertainment: {
                tour: null,
                tourist_attraction: null
            },
            hotel: null,
            services: services
        },
        how_much_money: {
            room: null,
            transport: modes_of_transport,
            tickets: null,
            tourist_attraction: null,
            that: null
        },
        how_does_this_work: {
            transport: modes_of_transport,
            bathroom: null,
            tour: null
        },
        is_X_Y: {
            food: adjectives,
            water: adjectives,
            transport: adjectives,
            tourist_attraction: adjectives,
            tour: adjectives
        }
    },
    statements: {
        I_want_a: _.extend({
            transport: modes_of_transport,
            services: services,
            hotel: null
        }, consumables ),
        I_want_to_do: {
            buy: {
                map: null,
                luggage: null,
                clothes: null,
                food: null,
                tickets: null
            }
        }
    }
}
