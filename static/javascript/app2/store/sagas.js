import {delay} from 'redux-saga';
import {put, call, select, takeEvery, all} from 'redux-saga/effects';
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
    indicatorListReloadRequest,
    indicatorListReloadSuccess,
    indicatorListReloadFailed,
    indicatorReloadRequest,
    indicatorReloadSuccess,
    indicatorReloadFailed,
    INDICATOR_LIST_RELOAD_SUCCESS,
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
        return pollIndicatorList(strategy.indicator_list_id);
    });
}

/**
 * @param {string} id
 */
function* pollIndicatorList(id) {
    try {
        yield put(indicatorListReloadRequest(id));
        const response = yield call(Api.fetchIndicatorList, id);
        yield put(indicatorListReloadSuccess(id, response));
    } catch (error) {
        yield put(indicatorListReloadFailed(id));
    }
}

/**
 *
 */
function* watchFetchProducts() {
    yield takeEvery(INDICATOR_LIST_RELOAD_SUCCESS, pollIndicators);
}

/**
 * @param {object} action
 */
function* pollIndicators(action) {
    yield action.indicatorList.item_id_list.map((indicatorId) => {
        return pollIndicator(action.id, indicatorId);
    });
}

/**
 *
 * @param {string} indicatorListId
 * @param {string} id
 */
function* pollIndicator(indicatorListId, id) {
    try {
        yield put(indicatorReloadRequest(indicatorListId, id));
        const response = yield call(Api.fetchIndicator, id);
        yield put(indicatorReloadSuccess(indicatorListId, id, response));
    } catch (error) {
        yield put(indicatorReloadFailed(id));
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
        yield delay(20000);
    }
}

/**
 * Root saga.
 */
export default function* sagas() {
    yield all([
        call(watchFetchProducts),
        call(pollApplication),
    ]);
}
