import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {Line} from 'react-chartjs-2';

/**
 * Indicator list.
 */
class IndicatorGroup extends Component {
    /**
     * @type {{tradeList: (*)}}
     */
    static propTypes = {
        indicatorGroup: PropTypes.arrayOf(
            PropTypes.shape({
                title: PropTypes.string.isRequired,
                dataSet: PropTypes.array.isRequired,
                labels: PropTypes.array.isRequired,
            })
        ).isRequired,
    };

    /**
     * @type {[*]}
     */
    static colors = [
        {
            main: 'rgba(75,192,192,1)',
            background: 'rgba(75,192,192,0.4)',
        },
        {
            main: 'rgba(192,75,75,1)',
            background: 'rgba(192,75,75,0.4)',
        },
        {
            main: 'rgba(192,75,192,1)',
            background: 'rgba(192,75,192,0.4)',
        },
        {
            main: 'rgba(75,192,75,1)',
            background: 'rgba(75,192,75,0.4)',
        },
        {
            main: 'rgba(75,192,192,1)',
            background: 'rgba(75,192,192,0.4)',
        },
        {
            main: 'rgba(75,75,75,1)',
            background: 'rgba(75,75,75,0.4)',
        },
        {
            main: 'rgba(1,1,1,1)',
            background: 'rgba(1,1,1,0.4)',
        },
    ];

    /**
     * @param {string} label
     * @param {Array} data
     * @param {string} color
     * @param {string} backgroundColor
     *
     * @return {{
     *  label: *,
     *  fill: boolean,
     *  lineTension: number,
     *  backgroundColor: *,
     *  borderColor: *,
     *  borderCapStyle: string,
     *  borderDash: Array,
     *  borderDashOffset: number,
     *  borderJoinStyle: string,
     *  pointBorderColor: *,
     *  pointBackgroundColor: string,
     *  pointBorderWidth: number,
     *  pointHoverRadius: number,
     *  pointHoverBackgroundColor: *,
     *  pointHoverBorderColor: string,
     *  pointHoverBorderWidth: number,
     *  pointRadius: number,
     *  pointHitRadius: number,
     *  data: *
     * }}
     */
    static createDataSet(label, data, color, backgroundColor) {
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
            data: data,
        };
    }

    /**
     * @return {{labels: Array, datasets: Array}}
     */
    static createChartData() {
        let dataSets = [];
        let labels = [];
        let colorIndex = 0;
        let availableColorCount = this.colors.length();

        this.props.indicatorGroup.forEach((indicator) => {
            let color = colorIndex;
            dataSets.push(
                this.createDataSet(
                    indicator.title,
                    indicator.dataSet,
                    color.main,
                    color.background,
                )
            );

            labels.push(indicator.labels);

            colorIndex++;
            if (colorIndex >= availableColorCount) {
                colorIndex = 0;
            }
        });

        return {
            labels: labels,
            datasets: dataSets,
        };
    }

    /**
     * @return {XML}
     */
    render() {
        if (this.props.indicatorGroup.length === 0) {
            return null;
        }

        return (
            <div className="indicatorGroup">
                <div className="description col-md-12">
                    <h2>Indicator</h2>
                    <Line data={this.createChartData()} />
                </div>
            </div>
        );
    }
}

export default IndicatorGroup;
