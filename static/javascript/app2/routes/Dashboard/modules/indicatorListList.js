import {
    INDICATOR_RELOAD_REQUEST,
    INDICATOR_RELOAD_SUCCESS,
} from './actions';

/**
 * @param {object} state
 * @param {object} action
 *
 * @return {*}
 */
function indicatorListList(
    state = {
        items: [],
    },
    action
) {
    let newItems = state.items;
    switch (action.type) {
        case INDICATOR_RELOAD_REQUEST:
            if (newItems.hasOwnProperty(action.indicatorListId)) {
                newItems[action.indicatorListId].isFetching = true;
            } else {
                newItems[action.indicatorListId] = {
                    id: action.indicatorListId,
                    data: {
                        id: action.id,
                        data: action.indicator,
                        isFetching: true,
                    },
                    isFetching: true,
                };
            }

            if (newItems[action.indicatorListId].hasOwnProperty(action.id)) {
                newItems[action.indicatorListId][action.id].isFetching = true;
            } else {
                newItems[action.indicatorListId][action.id] = {
                    id: action.id,
                    data: [],
                    isFetching: true,
                };
            }

            return Object.assign(
                {},
                state,
                {
                    items: newItems,
                }
            );
        case INDICATOR_RELOAD_SUCCESS:
            newItems[action.indicatorListId].isFetching = false;
            newItems[action.indicatorListId][action.id] = {
                id: action.id,
                data: action.indicator,
                isFetching: true,
            };

            return Object.assign(
                {},
                state,
                {
                    items: newItems,
                }
            );
        default:
            return state;
    };
}

export default indicatorListList;
