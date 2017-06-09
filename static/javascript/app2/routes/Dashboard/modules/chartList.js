import {
    CHART_RELOAD_REQUEST,
    CHART_RELOAD_SUCCESS,
} from './actions';

/**
 * @param {object} state
 * @param {object} action
 *
 * @return {*}
 */
function chartList(
    state = {
        items: [],
    },
    action
) {
    let newItems = state.items;
    switch (action.type) {
        case CHART_RELOAD_REQUEST:
            if (newItems.hasOwnProperty(action.id)) {
                newItems[action.id].isFetching = true;
            } else {
                newItems[action.id] = {
                    id: action.id,
                    data: {},
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
        case CHART_RELOAD_SUCCESS:
            newItems[action.id] = {
                id: action.id,
                data: action.chart,
                isFetching: false,
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

export default chartList;
