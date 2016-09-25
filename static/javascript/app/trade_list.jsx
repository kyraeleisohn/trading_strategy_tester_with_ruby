import React from 'react';

class TradeList extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            data: {
                data: []
            }
        };
    }

    loadDataFromServer() {
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
    }

    componentDidMount() {
        this.loadDataFromServer();
        setInterval(this.loadDataFromServer, this.props.pollInterval);
    }

    render() {
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

export default TradeList;