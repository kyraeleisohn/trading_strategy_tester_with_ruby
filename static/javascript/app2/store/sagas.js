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
function* pollApplication() {
    yield call(pollExchangeList);
    yield call(pollStrategyList);
    yield call(pollStatisticList);
}

/**
 * Root saga.
 */
export default function* sagas() {
    while (true) {
        yield call(pollApplication);
        yield delay(20000);
    }
}
