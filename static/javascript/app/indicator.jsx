import React from 'react';
import IndicatorChart from './indicator_chart.jsx';

class Indicator extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            chart_id: null,
        };
    }

    loadDataFromServer() {
        $.ajax(
            {
                url: this.props.url + '/' + this.props.dataId,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.setState(data);
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
        return (
            <IndicatorChart dataId={this.state.chart_id} url="/strategy_charts" pollInterval="20000"/>
        );
    }
}

export default Indicator;