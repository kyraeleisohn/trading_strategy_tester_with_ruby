import Page from './page.jsx';
import Pager from './pager.jsx';
import StrategyList from './strategy_list.jsx';
import Exchange from './exchange.jsx';

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