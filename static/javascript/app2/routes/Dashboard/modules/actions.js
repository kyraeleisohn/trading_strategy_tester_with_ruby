export const EXCHANGE_LIST_RELOAD_REQUEST = 'EXCHANGE_LIST_RELOAD_REQUEST';
export const EXCHANGE_LIST_RELOAD_SUCCESS = 'EXCHANGE_LIST_RELOAD_SUCCESS';
export const EXCHANGE_LIST_RELOAD_FAILED = 'EXCHANGE_LIST_RELOAD_FAILED';

export const STRATEGY_LIST_RELOAD_REQUEST = 'STRATEGY_LIST_RELOAD_REQUEST';
export const STRATEGY_LIST_RELOAD_SUCCESS = 'STRATEGY_LIST_RELOAD_SUCCESS';
export const STRATEGY_LIST_RELOAD_FAILED = 'STRATEGY_LIST_RELOAD_FAILED';

export const TRADE_LIST_RELOAD_REQUEST = 'TRADE_LIST_RELOAD_REQUEST';
export const TRADE_LIST_RELOAD_SUCCESS = 'TRADE_LIST_RELOAD_SUCCESS';
export const TRADE_LIST_RELOAD_FAILED = 'TRADE_LIST_RELOAD_FAILED';

export const STATISTIC_RELOAD_REQUEST = 'STATISTIC_RELOAD_REQUEST';
export const STATISTIC_RELOAD_SUCCESS = 'STATISTIC_RELOAD_SUCCESS';
export const STATISTIC_RELOAD_FAILED = 'STATISTIC_RELOAD_FAILED';

export const INDICATOR_LIST_RELOAD_REQUEST = 'INDICATOR_LIST_RELOAD_REQUEST';
export const INDICATOR_LIST_RELOAD_SUCCESS = 'INDICATOR_LIST_RELOAD_SUCCESS';
export const INDICATOR_LIST_RELOAD_FAILED = 'INDICATOR_LIST_RELOAD_FAILED';

export const INDICATOR_RELOAD_REQUEST = 'INDICATOR_RELOAD_REQUEST';
export const INDICATOR_RELOAD_SUCCESS = 'INDICATOR_RELOAD_SUCCESS';
export const INDICATOR_RELOAD_FAILED = 'INDICATOR_RELOAD_FAILED';

/**
 * @return {{type: string}}
 */
export function exchangeListReloadRequest() {
    return {
        type: EXCHANGE_LIST_RELOAD_REQUEST,
    };
}

/**
 * @return {{type: string}}
 */
export function exchangeListReloadFailed() {
    return {
        type: EXCHANGE_LIST_RELOAD_FAILED,
    };
}

/**
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function exchangeListReloadSuccess(json) {
    return {
        type: EXCHANGE_LIST_RELOAD_SUCCESS,
        exchangeList: json,
    };
}

/**
 * @return {{type: string}}
 */
export function strategyListReloadRequest() {
    return {
        type: STRATEGY_LIST_RELOAD_REQUEST,
    };
}

/**
 * @return {{type: string}}
 */
export function strategyListReloadFailed() {
    return {
        type: STRATEGY_LIST_RELOAD_FAILED,
    };
}

/**
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function strategyListReloadSuccess(json) {
    return {
        type: STRATEGY_LIST_RELOAD_SUCCESS,
        strategyList: json,
    };
}

/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function statisticReloadRequest(id) {
    return {
        type: STATISTIC_RELOAD_REQUEST,
        id: id,
    };
}

/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function statisticReloadFailed(id) {
    return {
        type: STATISTIC_RELOAD_REQUEST,
        id: id,
    };
}

/**
 * @param {string} id
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function statisticReloadSuccess(id, json) {
    return {
        type: STATISTIC_RELOAD_SUCCESS,
        id: id,
        statistic: json,
    };
}


/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function tradeListReloadRequest(id) {
    return {
        type: TRADE_LIST_RELOAD_REQUEST,
        id: id,
    };
}

/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function tradeListReloadFailed(id) {
    return {
        type: TRADE_LIST_RELOAD_FAILED,
        id: id,
    };
}

/**
 * @param {string} id
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function tradeListReloadSuccess(id, json) {
    return {
        type: TRADE_LIST_RELOAD_SUCCESS,
        id: id,
        tradeList: json,
    };
}

/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function indicatorListReloadRequest(id) {
    return {
        type: INDICATOR_LIST_RELOAD_REQUEST,
        id: id,
    };
}

/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function indicatorListReloadFailed(id) {
    return {
        type: INDICATOR_LIST_RELOAD_FAILED,
        id: id,
    };
}

/**
 * @param {string} id
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function indicatorListReloadSuccess(id, json) {
    return {
        type: INDICATOR_LIST_RELOAD_SUCCESS,
        id: id,
        indicatorList: json,
    };
}

/**
 * @param {string} indicatorListId
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function indicatorReloadRequest(indicatorListId, id) {
    return {
        type: INDICATOR_RELOAD_REQUEST,
        indicatorListId: indicatorListId,
        id: id,
    };
}

/**
 * @param {string} indicatorListId
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function indicatorReloadFailed(indicatorListId, id) {
    return {
        type: INDICATOR_RELOAD_FAILED,
        indicatorListId: indicatorListId,
        id: id,
    };
}

/**
 * @param {string} indicatorListId
 * @param {string} id
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function indicatorReloadSuccess(indicatorListId, id, json) {
    return {
        type: INDICATOR_RELOAD_SUCCESS,
        indicatorListId: indicatorListId,
        id: id,
        indicator: json,
    };
}
