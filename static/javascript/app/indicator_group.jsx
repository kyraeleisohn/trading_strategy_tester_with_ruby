import React from 'react';
import {Line} from 'react-chartjs-2';

class IndicatorGroup extends React.Component {
    constructor(props) {
        super(props);
        this.state = {};
    }

    dataSet(label, data, color, backgoundColor) {
        return {
            label: label,
            fill: false,
            lineTension: 0.1,
            backgroundColor: backgoundColor,
            borderColor: color,
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: color,
            pointBackgroundColor: '#fff',
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: color,
            pointHoverBorderColor: 'rgba(220,220,220,1)',
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: data
        };
    }

    loadDataFromServer() {
        $.ajax(
            {
                url: this.props.url + '/' + this.props.dataId,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.refreshItems(data);
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error(this.props.url, status, err.toString());
                }.bind(this)
            }
        );
    }

    refreshItems(data) {
        data.item_id_list.map(
            function(item_id) {
                $.ajax(
                    {
                        url: '/strategy_indicators/' + item_id,
                        dataType: 'json',
                        cache: false,
                        success: function(data) {
                            this.refreshChart(data);
                        }.bind(this),
                        error: function(xhr, status, err) {
                            console.error('/strategy_indicators/' + item_id, status, err.toString());
                        }.bind(this)
                    }
                );
            }.bind(this)
        );
    }

    refreshChart(data) {
        $.ajax(
            {
                url: '/strategy_charts/' + data.chart_id,
                dataType: 'json',
                cache: false,
                success: function(data) {
                    this.refreshState(data);
                }.bind(this),
                error: function(xhr, status, err) {
                    console.error('/strategy_charts/' + data.chart_id, status, err.toString());
                }.bind(this)
            }
        );
    }

    refreshState(chart) {
        var tempState = this.state;
        tempState[chart.id] = chart;

        this.setState(tempState);
    }

    componentDidMount() {
        this.loadDataFromServer();
        setInterval(this.loadDataFromServer.bind(this), this.props.pollInterval);
    }

    render() {

        var dataSets = new Array;
        var labels = new Array;
        var colors = [
            {
                main: 'rgba(75,192,192,1)',
                background: 'rgba(75,192,192,0.4)'
            },
            {
                main: 'rgba(192,75,75,1)',
                background: 'rgba(192,75,75,0.4)'
            },
            {
                main: 'rgba(192,75,192,1)',
                background: 'rgba(192,75,192,0.4)'
            },
            {
                main: 'rgba(75,192,75,1)',
                background: 'rgba(75,192,75,0.4)'
            },
            {
                main: 'rgba(75,192,192,1)',
                background: 'rgba(75,192,192,0.4)'
            },
            {
                main: 'rgba(75,75,75,1)',
                background: 'rgba(75,75,75,0.4)'
            },
            {
                main: 'rgba(1,1,1,1)',
                background: 'rgba(1,1,1,0.4)'
            },
        ];
        var color_index = 0;

        for (var indicator_id in this.state) {
            if (!this.state.hasOwnProperty(indicator_id)) {
                continue;
            }
            var indicator = this.state[indicator_id];
            if (indicator.data_sets && indicator.data_sets.value)
            {
                var color = colors[color_index];
                color_index++;
                dataSets.push(
                    this.dataSet(
                        indicator.name,
                        indicator.data_sets.value,
                        color['main'],
                        color['background']
                    )
                );

                labels = indicator.labels
            }
        }

        var chartData = {
            labels : labels,
            datasets : dataSets
        };

        return (
            <div className="indicatorGroup">
                <div className="description col-md-12">
                    <h2>Indicator</h2>
                    <Line data={chartData} />
                </div>
            </div>
        );
    }
}

export default IndicatorGroup;