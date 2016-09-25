import React from 'react';
import Strategy from './strategy.jsx';

class StrategyList extends React.Component {
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

export default StrategyList;