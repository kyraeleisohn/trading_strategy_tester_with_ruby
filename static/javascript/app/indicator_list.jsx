import React from 'react';
import Indicator from './indicator.jsx';

class IndicatorList extends React.Component {
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
        var indicatorList = this.state.data.data.map(
            function(indicator) {
                return (
                    <Indicator dataId={indicator.id} url="/strategy_indicators" pollInterval="20000"/>
                );
            }
        );

        return (
            <div className="indicatorList">
                {indicatorList}
            </div>
        );
    }
}

export default IndicatorList;