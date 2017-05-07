import {
    STRATEGY_LIST_RELOAD_REQUEST,
    STRATEGY_LIST_RELOAD_SUCCESS,
} from './actions';

/**
 * @param {object} state
 * @param {object} action
 *
 * @return {*}
 */
function strategyList(
    state = {
        isFetching: false,
        items: [],
    },
    action
) {
    switch (action.type) {
        case STRATEGY_LIST_RELOAD_REQUEST:
            return Object.assign(
                {},
                state,
                {
                    isFetching: true,
                }
            );
        case STRATEGY_LIST_RELOAD_SUCCESS:
            return Object.assign(
                {},
                state,
                {
                    isFetching: false,
                    items: action.strategyList.data,
                }
            );
        default:
            return state;
    };
}

export default strategyList;
