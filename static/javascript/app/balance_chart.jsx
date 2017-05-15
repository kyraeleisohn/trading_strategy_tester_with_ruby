import React from 'react';
import {Line} from 'react-chartjs-2';

class BalanceChart extends Component {
    dataSet(label, data, color, backgroundColor) {
        return {
            label: label,
            fill: false,
            lineTension: 0.1,
            backgroundColor: backgroundColor,
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

    render() {
        var dataSets = new Array;

        dataSets.push(
            this.dataSet(
                'Floating value',
                this.state.data_sets.floating_value,
                'rgba(75,192,192,1)',
                'rgba(75,192,192,0.4)'
            )
        );
        dataSets.push(
            this.dataSet(
                'Closed value',
                this.state.data_sets.closed_value,
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
                <h2>Balance</h2>
                <Line data={chartData} />
            </div>
        );
    }
}

export default BalanceChart;