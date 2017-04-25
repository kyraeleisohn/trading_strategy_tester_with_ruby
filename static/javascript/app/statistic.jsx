import React from 'react';

class Statistic extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            data: {
            }
        };
    }

    loadDataFromServer() {
        $.ajax(
            {
                url: this.props.url + '/' + this.props.dataId ,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.setState(
                        {
                            data: data
                        }
                    );
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            }
        );
    }

    componentDidMount() {
        this.loadDataFromServer();
        setInterval(this.loadDataFromServer.bind(this), this.props.pollInterval);
    }

    render() {
        var statistic = this.state.data

        return (
            <div className="statistic col-md-6">
                <h2>Strategy Statistic</h2>
                <table className="table table-hover table-condensed">
                    <tbody>
                    <tr>
                        <th>Profit</th>
                        <td>{statistic.profit}</td>
                    </tr>
                    <tr>
                        <th>Spread cost</th>
                        <td>{statistic.spread_cost}</td>
                    </tr>
                    <tr>
                        <th>Profitability</th>
                        <td>{statistic.profitability}</td>
                    </tr>
                    <tr>
                        <th>Trade count</th>
                        <td>{statistic.trade_count}</td>
                    </tr>
                    <tr>
                        <th>Average loss</th>
                        <td>{statistic.average_loss}</td>
                    </tr>
                    <tr>
                        <th>Average win</th>
                        <td>{statistic.average_win}</td>
                    </tr>
                    <tr>
                        <th>Maximum loss</th>
                        <td>{statistic.maximum_loss}</td>
                    </tr>
                    <tr>
                        <th>Maximum win</th>
                        <td>{statistic.maximum_win}</td>
                    </tr>
                    <tr>
                        <th>Buy percentage</th>
                        <td>{statistic.buy_percentage}</td>
                    </tr>
                    <tr>
                        <th>Buy win count</th>
                        <td>{statistic.buy_win_count}</td>
                    </tr>
                    <tr>
                        <th>Sell win count</th>
                        <td>{statistic.sell_win_count}</td>
                    </tr>
                    <tr>
                        <th>Average trade length</th>
                        <td>{statistic.average_trade_length}</td>
                    </tr>
                    <tr>
                        <th>OM count</th>
                        <td>{statistic.one_minute_trade_count}</td>
                    </tr>
                    <tr>
                        <th>OM profit</th>
                        <td>{statistic.one_minute_trade_profit}</td>
                    </tr>
                    <tr>
                        <th>OM win percentage</th>
                        <td>{statistic.one_minute_trade_win_percentage}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        );
    }
}

export default Statistic;



