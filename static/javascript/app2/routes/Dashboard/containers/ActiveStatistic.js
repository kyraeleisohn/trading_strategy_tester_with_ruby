import {connect} from 'react-redux';
import Statistic from '../components/Statistic';

const mapStateToProps = (state, ownProps) => {
    if (!state.statistic.items.hasOwnProperty(ownProps.dataId)) {
        return {};
    }

    return {
        statistic: state.statistic.items[ownProps.dataId].data,
    };
};

const ActiveStatistic = connect(mapStateToProps)(Statistic);

export default ActiveStatistic;
