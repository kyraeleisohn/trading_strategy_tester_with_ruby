import React from 'react';
import Exchange from './exchange.jsx';

class ExchangeList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            data: []
        };
    }

    loadDataFromServer() {
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
    }

    componentDidMount() {
        this.loadDataFromServer();
        setInterval(this.loadDataFromServer, this.props.pollInterval);
    }

    render() {
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

export default ExchangeList;