import {connect} from 'react-redux';
import TradeList from '../components/TradeList';

const mapStateToProps = (state, ownProps) => {
    if (!state.tradeListList.items.hasOwnProperty(ownProps.dataId)) {
        return {
            tradeList: [],
        };
    }

    return {
        tradeList: state.tradeListList.items[ownProps.dataId].data,
    };
};

const ActiveTradeList = connect(mapStateToProps)(TradeList);

export default ActiveTradeList;
