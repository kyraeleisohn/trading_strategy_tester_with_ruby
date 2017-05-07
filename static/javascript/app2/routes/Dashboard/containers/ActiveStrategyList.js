import {connect} from 'react-redux';
import StrategyList from '../components/StrategyList';

const mapStateToProps = (state) => {
    return {
        strategyList: state.strategyList.items,
    };
};

const ActiveStrategyList = connect(mapStateToProps)(StrategyList);

export default ActiveStrategyList;
