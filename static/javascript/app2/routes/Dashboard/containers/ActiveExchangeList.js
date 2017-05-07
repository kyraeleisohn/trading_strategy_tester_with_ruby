import {connect} from 'react-redux';
import ExchangeList from '../components/ExchangeList';

const mapStateToProps = (state) => {
    return {
        exchangeList: state.exchangeList.items,
    };
};

const ActiveExchangeList = connect(mapStateToProps)(ExchangeList);

export default ActiveExchangeList;
