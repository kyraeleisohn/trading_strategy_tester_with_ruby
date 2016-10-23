import React from 'react';
import {Line} from 'react-chartjs-2';

class ExchangeChart extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            data : []
        };
    }

    default() {
        return {
            labels: [],
            datasets: [
                {
                    fill: false,
                    lineTension: 0.1,
                    backgroundColor: 'rgba(75,192,192,0.4)',
                    borderColor: 'rgba(75,192,192,1)',
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    pointBorderColor: 'rgba(75,192,192,1)',
                    pointBackgroundColor: '#fff',
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: 'rgba(75,192,192,1)',
                    pointHoverBorderColor: 'rgba(220,220,220,1)',
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    data: []
                }
            ]
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
        var label = new Array;
        var dataSet = new Array;
        for (var i = 0, length = this.state.data.length; i < length; i++) {
            dataSet.push(this.state.data[i].value);
            label.push(this.state.data[i].datetime);
        }

        var chartData = this.default();
        chartData.datasets[0].data = dataSet;
        chartData.labels = label;

        return (
            <div className="exchange_chart col-md-12">
                <Line data={chartData} />
            </div>
        );
    }
}

export default ExchangeChart;