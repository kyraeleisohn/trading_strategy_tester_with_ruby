import {
    TRADE_LIST_RELOAD_REQUEST,
    TRADE_LIST_RELOAD_SUCCESS,
} from './actions';

/**
 * @param {object} state
 * @param {object} action
 *
 * @return {*}
 */
function tradeListList(
    state = {
        items: [],
    },
    action
) {
    let newItems = state.items;
    switch (action.type) {
        case TRADE_LIST_RELOAD_REQUEST:
            if (newItems.hasOwnProperty(action.id)) {
                newItems[action.id].isFetching = true;
            } else {
                newItems[action.id] = {
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
        case TRADE_LIST_RELOAD_SUCCESS:
            newItems[action.id] = {
                id: action.id,
                data: action.tradeList.data,
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

export default tradeListList;
