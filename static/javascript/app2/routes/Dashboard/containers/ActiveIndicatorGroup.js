import {connect} from 'react-redux';
import IndicatorGroup from '../components/IndicatorGroup';

const mapStateToProps = (state, ownProps) => {
    let chartItems = Object.values(state.chartList.items);

    let indicatorGroup = chartItems.filter(function(item) {
        return ownProps.dataIdList.indexOf(item.id) !== -1;
    });

    return {
        indicatorGroup: indicatorGroup,
    };
};

const ActiveIndicatorGroup = connect(mapStateToProps)(IndicatorGroup);

export default ActiveIndicatorGroup;
