import exchange from './exchange';
import {
    EXCHANGE_LIST_RELOAD_REQUEST,
    EXCHANGE_LIST_RELOAD_SUCCESS,
} from './actions';

/**
 * @param {object} state
 * @param {object} action
 *
 * @return {*}
 */
function exchangeList(
    state = {
        isFetching: false,
        items: [],
    },
    action
) {
    switch (action.type) {
        case EXCHANGE_LIST_RELOAD_REQUEST:
            return Object.assign(
                {},
                state,
                {
                    isFetching: true,
                }
            );
        case EXCHANGE_LIST_RELOAD_SUCCESS:
            return Object.assign(
                {},
                state,
                {
                    isFetching: false,
                    items: action.exchangeList.map(exchange),
                }
            );
        default:
            return state;
    };
}

export default exchangeList;
