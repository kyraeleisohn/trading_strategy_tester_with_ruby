import {combineReducers} from 'redux';
import exchangeList from '../routes/Dashboard/modules/exchangeList';
import strategyList from '../routes/Dashboard/modules/strategyList';
import statistic from '../routes/Dashboard/modules/statistic';
import tradeListList from '../routes/Dashboard/modules/tradeListList';

const reducers = combineReducers({
    exchangeList,
    strategyList,
    statistic,
    tradeListList,
});

export default reducers;
