import React from 'react';
import PropTypes from 'prop-types';

/**
 * Trade.
 */
class Trade extends React.Component {
    /**
     * @type {{tradeList: (*)}}
     */
    static propTypes = {
        trade: PropTypes.shape({
            type: PropTypes.string.isRequired,
            profit: PropTypes.number.isRequired,
            opening_date_time: PropTypes.string.isRequired,
            closing_date_time: PropTypes.string.isRequired,
            opening_price: PropTypes.number.isRequired,
            closing_price: PropTypes.number.isRequired,
            opening_ask_volume: PropTypes.number.isRequired,
            closing_ask_volume: PropTypes.number.isRequired,
        }).isRequired,
    };

    /**
     * @return {XML}
     */
    render() {
        let trade = this.props.trade;
        return (
            <tr>
                <td>{trade.type}</td>
                <td>{trade.profit}</td>
                <td>{trade.opening_date_time}</td>
                <td>{trade.closing_date_time}</td>
                <td>{trade.opening_price}</td>
                <td>{trade.closing_price}</td>
                <td>{trade.opening_ask_volume}</td>
                <td>{trade.closing_ask_volume}</td>
            </tr>
        );
    }
}

export default Trade;
