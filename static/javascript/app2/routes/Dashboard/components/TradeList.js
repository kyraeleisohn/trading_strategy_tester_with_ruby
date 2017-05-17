import React, {Component} from 'react';
import PropTypes from 'prop-types';
import Trade from './Trade';

/**
 * Trade list.
 */
class TradeList extends Component {
    /**
     * @type {{tradeList: (*)}}
     */
    static propTypes = {
        tradeList: PropTypes.arrayOf(
            PropTypes.shape({
                type: PropTypes.string,
                profit: PropTypes.number,
                opening_date_time: PropTypes.string,
                closing_date_time: PropTypes.string,
                opening_price: PropTypes.number,
                closing_price: PropTypes.number,
                opening_ask_volume: PropTypes.number,
                closing_ask_volume: PropTypes.number,
            })
        ).isRequired,
    };

    /**
     * @return {XML}
     */
    render() {
        if (this.props.tradeList.length === 0) {
            return null;
        }

        return (
            <div className="tradeList col-md-12">
                <h2>Trade list</h2>
                <table className="table table-hover table-condensed">
                    <thead>
                    <tr>
                        <th>Trade type</th>
                        <th>Profit</th>
                        <th>Opening date</th>
                        <th>Closing date</th>
                        <th>Opening price</th>
                        <th>Closing price</th>
                        <th>Opening volume</th>
                        <th>Closing volume</th>
                    </tr>
                    </thead>
                    <tbody>
                    {this.props.tradeList.map((trade) =>
                        <Trade key={trade.id} trade={trade}/>
                    )}
                    </tbody>
                </table>
            </div>
        );
    }
}

export default TradeList;
