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

export const CHART_RELOAD_REQUEST = 'CHART_RELOAD_REQUEST';
export const CHART_RELOAD_SUCCESS = 'CHART_RELOAD_SUCCESS';
export const CHART_RELOAD_FAILED = 'CHART_RELOAD_FAILED';

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
export function chartReloadRequest(id) {
    return {
        type: CHART_RELOAD_REQUEST,
        id: id,
    };
}

/**
 * @param {string} id
 *
 * @return {{type: string}}
 */
export function chartReloadFailed(id) {
    return {
        type: CHART_RELOAD_FAILED,
        id: id,
    };
}

/**
 * @param {string} id
 * @param {{type: json}} json
 *
 * @return {{type: string}}
 */
export function chartReloadSuccess(id, json) {
    return {
        type: CHART_RELOAD_SUCCESS,
        id: id,
        chart: json,
    };
}
