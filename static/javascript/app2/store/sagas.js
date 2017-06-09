import {delay} from 'redux-saga';
import {put, call, select} from 'redux-saga/effects';
import Api from '../api/Api';
import {
    exchangeListReloadRequest,
    exchangeListReloadSuccess,
    exchangeListReloadFailed,
    strategyListReloadRequest,
    strategyListReloadSuccess,
    strategyListReloadFailed,
    statisticReloadRequest,
    statisticReloadSuccess,
    statisticReloadFailed,
    tradeListReloadRequest,
    tradeListReloadSuccess,
    tradeListReloadFailed,
    chartReloadRequest,
    chartReloadSuccess,
    chartReloadFailed,
} from '../routes/Dashboard/modules/actions';

/**
 * @param {object} state
 *
 * @return {StrategyList.propTypes.strategyList}
 */
function getStrategyList(state) {
    return state.strategyList;
}

/**
 *
 */
function* pollExchangeList() {
    try {
        yield put(exchangeListReloadRequest());
        const response = yield call(Api.fetchExchange);
        yield put(exchangeListReloadSuccess(response));
    } catch (error) {
        yield put(exchangeListReloadFailed());
    }
}

/**
 *
 */
function* pollStrategyList() {
    try {
        yield put(strategyListReloadRequest());
        const response = yield call(Api.fetchStrategyList);
        yield put(strategyListReloadSuccess(response));
    } catch (error) {
        yield put(strategyListReloadFailed());
    }
}

/**
 *
 */
function* pollStatisticList() {
    let strategyList = yield select(getStrategyList);
    if (
        Object.prototype.toString.call(strategyList.items) !== '[object Array]'
    ) {
        return;
    }

    yield strategyList.items.map((strategy) => {
        return pollStatistic(strategy.id);
    });
}

/**
 * @param {string} id
 */
function* pollStatistic(id) {
    try {
        yield put(statisticReloadRequest(id));
        const response = yield call(Api.fetchStatistic, id);
        yield put(statisticReloadSuccess(id, response));
    } catch (error) {
        yield put(statisticReloadFailed(id));
    }
}

/**
 *
 */
function* pollTradeListList() {
    let strategyList = yield select(getStrategyList);
    if (
        Object.prototype.toString.call(strategyList.items) !== '[object Array]'
    ) {
        return;
    }

    yield strategyList.items.map((strategy) => {
        return pollTradeList(strategy.id);
    });
}

/**
 * @param {string} id
 */
function* pollTradeList(id) {
    try {
        yield put(tradeListReloadRequest(id));
        const response = yield call(Api.fetchTradeList, id);
        yield put(tradeListReloadSuccess(id, response));
    } catch (error) {
        yield put(tradeListReloadFailed(id));
    }
}

/**
 *
 */
function* pollIndicatorListList() {
    let strategyList = yield select(getStrategyList);
    if (
        Object.prototype.toString.call(strategyList.items) !== '[object Array]'
    ) {
        return;
    }

    yield strategyList.items.map((strategy) => {
        return pollChartList(strategy.indicator_chart_id_list);
    });
}

/**
 *
 */
function* pollBalanceList() {
    let strategyList = yield select(getStrategyList);
    if (
        Object.prototype.toString.call(strategyList.items) !== '[object Array]'
    ) {
        return;
    }

    yield strategyList.items.map((strategy) => {
        return pollChart(strategy.chart_id);
    });
}


/**
 * @param {Array} chartIdList
 */
function* pollChartList(chartIdList) {
    if (
        Object.prototype.toString.call(chartIdList) !== '[object Array]'
    ) {
        return;
    }

    yield chartIdList.map((chartId) => {
        return pollChart(chartId);
    });
}

/**
 * @param {string} id
 */
function* pollChart(id) {
    try {
        yield put(chartReloadRequest(id));
        const response = yield call(Api.fetchChart, id);
        yield put(chartReloadSuccess(id, response));
    } catch (error) {
        yield put(chartReloadFailed(id));
    }
}

/**
 *
 */
function* pollApplication() {
    while (true) {
        yield call(pollExchangeList);
        yield call(pollStrategyList);
        yield call(pollStatisticList);
        yield call(pollTradeListList);
        yield call(pollIndicatorListList);
        yield call(pollBalanceList);
        yield delay(20000);
    }
}

/**
 * Root saga.
 */
export default function* sagas() {
    yield call(pollApplication);
}
