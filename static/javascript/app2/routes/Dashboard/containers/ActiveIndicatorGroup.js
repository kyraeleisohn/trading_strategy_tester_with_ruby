import {connect} from 'react-redux';
import IndicatorGroup from '../components/IndicatorGroup';

const mapStateToProps = (state, ownProps) => {
    if (!state.indicatorListList.items.hasOwnProperty(ownProps.dataId)) {
        return {
            indicatorGroup: [],
        };
    }

    return {
        indicatorGroup: state.indicatorListList.items[ownProps.dataId].data,
    };
};

const ActiveIndicatorGroup = connect(mapStateToProps)(IndicatorGroup);

export default ActiveIndicatorGroup;
