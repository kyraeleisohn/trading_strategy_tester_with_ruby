import React from 'react';
import {Line} from 'react-chartjs-2';

class IndicatorChart extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            labels : [],
            data_sets : {
                minus_ten : [],
                plus_ten: []
            }
        };
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
                url: this.props.url + '/' + this.props.dataId ,
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
        var dataSets = new Array;

        dataSets.push(
            this.dataSet(
                'Plus 10%',
                this.state.data_sets.plus_ten,
                'rgba(75,192,192,1)',
                'rgba(75,192,192,0.4)'
            )
        );
        dataSets.push(
            this.dataSet(
                'Minus 10%',
                this.state.data_sets.minus_ten,
                'rgba(192,75,75,1)',
                'rgba(192,75,75,0.4)'
            )
        );

        var chartData = {
            labels : this.state.labels,
            datasets : dataSets
        };

        return (
            <div className="description col-md-12">
                <h2>Indicator</h2>
                <Line data={chartData} />
            </div>
        );
    }
}

export default IndicatorChart;