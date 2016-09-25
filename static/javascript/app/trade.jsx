import React from 'react';

class Trade extends React.Component {
    render() {
        var trade = this.props.data
        return (
            <tr>
                <td>{trade.type}</td>
                <td>{trade.opening_state_date_time}</td>
                <td>{trade.closing_state_date_time}</td>
                <td>{trade.opening_state_ask_price}</td>
                <td>{trade.closing_state_ask_price}</td>
                <td>{trade.opening_state_ask_volume}</td>
                <td>{trade.closing_state_ask_volume}</td>
            </tr>
        );
    }
}

export default Trade;