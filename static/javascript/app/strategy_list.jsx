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
        setInterval(this.loadDataFromServer.bind(this), this.props.pollInterval);
    }

    render() {
        var strategyList = this.state.data.data.map(
            function(strategy) {
                return (
                    <Strategy dataId={strategy.id} url="/strategies" pollInterval="100000"/>
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