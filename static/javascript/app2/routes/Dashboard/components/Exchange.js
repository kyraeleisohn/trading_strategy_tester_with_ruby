import React, {Component} from 'react';
import PropTypes from 'prop-types';

/**
 * Exchange.
 */
class Exchange extends Component {
    /**
     * @type {{exchange: (*)}}
     */
    static propTypes = {
        exchange: PropTypes.shape({
            id: PropTypes.string.isRequired,
            status: PropTypes.string.isRequired,
            cycle_maximum: PropTypes.number.isRequired,
            finished_cycles: PropTypes.number.isRequired,
            time_spent: PropTypes.string.isRequired,
            percentage: PropTypes.number.isRequired,
            average_cycle_time: PropTypes.string.isRequired,
        }).isRequired,
    };

    /**
     * @return {XML}
     */
    render() {
        let exchange = this.props.exchange;
        let divStyle = {
            width: exchange.percentage + '%',
        };

        return (
            <tr>
                <th>{exchange.status}</th>
                <th>{exchange.time_spent}</th>
                <th>{exchange.average_cycle_time}</th>
                <th>
                    <div className="progress">
                        <div
                            className="
                                progress-bar
                                progress-bar-success
                                progress-bar-striped
                            "
                            role="progressbar"
                            aria-valuenow={exchange.finished_cycles}
                            aria-valuemin="0"
                            aria-valuemax={exchange.cycle_maximum}
                            style={divStyle}>
                            <span className="sr-only">
                                {exchange.percentage}%
                                ({exchange.finished_cycles}
                                /
                                {exchange.cycle_maximum})
                                Completed
                            </span>
                            {exchange.percentage}%
                            ({exchange.finished_cycles}
                            /
                            {exchange.cycle_maximum})
                            Completed
                        </div>
                    </div>
                </th>
            </tr>
        );
    }
}

export default Exchange;
