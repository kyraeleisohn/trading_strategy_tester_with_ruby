import {combineReducers} from 'redux';
import exchangeList from '../routes/Dashboard/modules/exchangeList';
import strategyList from '../routes/Dashboard/modules/strategyList';
import statistic from '../routes/Dashboard/modules/statistic';

const reducers = combineReducers({
    exchangeList,
    strategyList,
    statistic,
});

export default reducers;
