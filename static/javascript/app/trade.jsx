import React from 'react';

class Trade extends React.Component {
    render() {
        var trade = this.props.data
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