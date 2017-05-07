import fetch from 'isomorphic-fetch';

export const EXCHANGE_LIST_RELOAD_REQUEST = 'EXCHANGE_LIST_RELOAD_REQUEST';
export const EXCHANGE_LIST_RELOAD_SUCCESS = 'EXCHANGE_LIST_RELOAD_SUCCESS';
export const STRATEGY_LIST_RELOAD_REQUEST = 'STRATEGY_LIST_RELOAD_REQUEST';
export const STRATEGY_LIST_RELOAD_SUCCESS = 'STRATEGY_LIST_RELOAD_SUCCESS';

/**
 * @return {{type: string}}
 */
function exchangeListReloadRequest() {
    return {
        type: EXCHANGE_LIST_RELOAD_REQUEST,
    };
}

/**
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
function exchangeListReloadSuccess(json) {
    return {
        type: EXCHANGE_LIST_RELOAD_SUCCESS,
        exchangeList: json,
    };
}

/**
 * @return {Function}
 */
function fetchExchangeList() {
    return function(dispatch) {
        dispatch(exchangeListReloadRequest());

        return fetch('/exchange_statuses?q=status:processing')
            .then((response) => response.json())
            .then((json) => dispatch(exchangeListReloadSuccess(json)))
        ;
    };
}

/**
 * @return {{type: string}}
 */
function strategyListReloadRequest() {
    return {
        type: STRATEGY_LIST_RELOAD_REQUEST,
    };
}

/**
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
function strategyListReloadSuccess(json) {
    return {
        type: STRATEGY_LIST_RELOAD_SUCCESS,
        strategyList: json,
    };
}

/**
 * @return {Function}
 */
function fetchStrategyList() {
    return function(dispatch) {
        dispatch(strategyListReloadRequest());

        return fetch('/strategies')
            .then((response) => response.json())
            .then((json) => dispatch(strategyListReloadSuccess(json)))
        ;
    };
}

/**
 * @return {Function}
 */
export function fetchApplication() {
    return function(dispatch) {
        dispatch(fetchExchangeList());
        dispatch(fetchStrategyList());
    };
}

/**
 * @return {Function}
 */
export function startTimer() {
    return function(dispatch) {
        setInterval(() => {
            dispatch(fetchApplication());
        }, 10000);
    };
}
