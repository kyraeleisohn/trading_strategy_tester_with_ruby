import {combineReducers} from 'redux';
import exchangeList from '../routes/Dashboard/modules/exchangeList';
import strategyList from '../routes/Dashboard/modules/strategyList';

const reducers = combineReducers({
    exchangeList,
    strategyList,
});

export default reducers;
