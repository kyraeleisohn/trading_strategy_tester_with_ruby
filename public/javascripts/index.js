var Description = React.createClass(
    {
        loadDataFromServer: function() {
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
        },
        getInitialState: function() {
            return {
                data: {
                }
            };
        },
        componentDidMount: function() {
            this.loadDataFromServer();
            setInterval(this.loadDataFromServer, this.props.pollInterval);
        },
        render: function() {
            var description = this.state.data
            var parameterList = JSON.stringify(description.parameter_list)

            return (
                <div className="description col-md-6">
                <h2>Strategy Description</h2>
                    <table className="table table-hover table-condensed">
                        <tbody>
                            <tr>
                                <th>Name</th>
                                <td>{description.name}</td>
                            </tr>
                            <tr>
                                <th>Parameter list</th>
                                <td>{parameterList}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            );
        }
    }
);
var Statistic = React.createClass(
    {
        loadDataFromServer: function() {
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
        },
        getInitialState: function() {
            return {
                data: {
                }
            };
        },
        componentDidMount: function() {
            this.loadDataFromServer();
            setInterval(this.loadDataFromServer, this.props.pollInterval);
        },
        render: function() {
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
);
var Trade = React.createClass(
    {
        render: function() {
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
);
var Page = React.createClass(
    {
        render: function() {
            page = this.props.data
            return (
                <li>
                <a href="{page.url}">{page.page_number}</a>
        </li>
);
}
}
);
var Pager = React.createClass(
    {
        render: function() {
            pager = this.props.data

            var pages = pager.pages.map(
                function(trade) {
                    return (
                        <Page data={trade} />
                    );
                }
            );

            return (
                <div className="pagination pagination-centered">
                <ul>
                <li>
                <a href="{pager.prev_page_url}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
            </li>
            {pages}
            <li>
            <a href="{pager.next_page_url}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
            </li>
            </ul>
            </div>
            );
        }
    }
);
var TradeList = React.createClass(
    {
        loadDataFromServer: function() {
    $.ajax(
        {
            url: this.props.url + '/' + this.props.dataId + '/trades',
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
},
getInitialState: function() {
    return {
        data: {
            data: []
        }
    };
},
componentDidMount: function() {
    this.loadDataFromServer();
    setInterval(this.loadDataFromServer, this.props.pollInterval);
},
render: function() {
    var tradeList = this.state.data.data.map(
        function(trade) {
            return (
                <Trade data={trade} />
            );
        }
    );

    var pager = function() {
            return (
                <Trade data={this.state.data} />
);
}

return (
    <div className="tradeList col-md-12">
    <h2>Trade list</h2>
<table className="table table-hover table-condensed">
    <thead>
    <tr>
    <th>Trade type</th>
<th>Opening date</th>
<th>Closing date</th>
<th>Opening price</th>
<th>Closing price</th>
<th>Opening volume</th>
<th>Closing volume</th>
</tr>
</thead>
<tbody>{tradeList}</tbody>
</table>
{pager}
</div>
);
}
}
);
var Strategy = React.createClass(
    {
        render: function() {
            return (
                <div className="strategy row-fluid">
                    <div className="col-md-12">
                        <h1>Strategy</h1>
                        <Description dataId={this.props.dataId} url="/strategy_descriptions" pollInterval="2000"/>
                        <Chart dataId={this.props.dataId} url="/strategy_charts" pollInterval="2000"/>
                        <Statistic dataId={this.props.dataId} url="/strategy_statistics" pollInterval="2000"/>
                        <TradeList dataId={this.props.dataId} url="/strategies" pollInterval="2000"/>
                    </div>
                </div>
            );
        }
    }
);
var StrategyList = React.createClass(
    {
        loadDataFromServer: function() {
            $.ajax(
                {
                    url: this.props.url,
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
        },
        getInitialState: function() {
            return {
                data: {
                    data: []
                }
            };
        },
        componentDidMount: function() {
            this.loadDataFromServer();
            setInterval(this.loadDataFromServer, this.props.pollInterval);
        },

        render: function() {
            var strategyList = this.state.data.data.map(
                function(strategyStatistic) {
                    return (
                        <Strategy dataId={strategyStatistic.id} />
            );
        }
);

return (
    <div className="strategyList">
    {strategyList}
    </div>
);
}
}
);

var Exchange = React.createClass(
    {
        formatTimeInterval: function (seconds_count) {
            var hours   = Math.floor(seconds_count / 3600);
            var minutes = Math.floor((seconds_count - (hours * 3600)) / 60);
            var seconds = seconds_count - (hours * 3600) - (minutes * 60);
            var result = '';

            if (hours)
            {
                result = result + hours + ' hour(s) '
            }
            if (minutes)
            {
                result = result + minutes + ' minute(s) '
            }
            if (seconds)
            {
                result = result + seconds + ' second(s) '
            }

            return result;
        },

        render: function() {
            var exchange = this.props.data;
            var percentage = Math.floor((exchange.finished_cycles / exchange.cycle_maximum) * 100);
            var time_spent = this.formatTimeInterval(exchange.time_spent);
            var average_cycle_time = this.formatTimeInterval(exchange.time_spent / exchange.finished_cycles);
            var divStyle = {
                width: percentage + '%',
            }

            return (
                <tr>
                    <th>{exchange.status}</th>
                    <th>{time_spent}</th>
                    <th>{average_cycle_time}</th>
                    <th>
                        <div className="progress">
                            <div className="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow={exchange.finished_cycles} aria-valuemin="0" aria-valuemax={exchange.cycle_maximum} style={divStyle}>
                                <span className="sr-only"> {percentage}% ({exchange.finished_cycles} / {exchange.cycle_maximum}) Completed </span>
                                {percentage}% ({exchange.finished_cycles} / {exchange.cycle_maximum}) Completed
                            </div>
                        </div>
                    </th>
                </tr>
            );
        }
    }
);

var ExchangeList = React.createClass(
    {
        loadDataFromServer: function() {
            $.ajax(
                {
                    url: this.props.url,
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
        },
        getInitialState: function() {
            return {
                data: []
            };
        },
        componentDidMount: function() {
            this.loadDataFromServer();
            setInterval(this.loadDataFromServer, this.props.pollInterval);
        },
        render: function() {
            var exchangeList = this.state.data.map(
                function(exchange) {
                    return (
                        <Exchange data={exchange} />
                    );
                }
            );

            if (exchangeList.length == 0)
            {
                return null;
            }

            return (
                <div className="exchangeList">
                    <div className="panel panel-default">
                    <div className="panel-heading">Active exchanges</div>
                        <div className="panel-body">
                            <p>List of the currently running exchanges</p>
                        </div>
                        <table className="table table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>Status</th>
                                    <th>Time</th>
                                    <th>Average cycle time</th>
                                    <th>Progress</th>
                                </tr>
                            </thead>
                            {exchangeList}
                        </table>
                    </div>
                </div>
            );
        }
    }
);
var Content = React.createClass(
    {
        render: function() {
            return (
                <div className="content">
                    <ExchangeList url="/exchange_statuses?q=status:processing" pollInterval="2000"/>
                    <StrategyList url="/strategy_statistics" pollInterval="2000"/>
                </div>
            );
        }
    }
);
ReactDOM.render(
<Content/>,
    document.getElementById('content')
);