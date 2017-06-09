import {combineReducers} from 'redux';
import exchangeList from '../routes/Dashboard/modules/exchangeList';
import strategyList from '../routes/Dashboard/modules/strategyList';
import statistic from '../routes/Dashboard/modules/statistic';
import tradeListList from '../routes/Dashboard/modules/tradeListList';
import indicatorListList from '../routes/Dashboard/modules/indicatorListList';
import chartList from '../routes/Dashboard/modules/chartList';

const reducers = combineReducers({
    exchangeList,
    strategyList,
    statistic,
    tradeListList,
    indicatorListList,
    chartList,
});

export default reducers;
