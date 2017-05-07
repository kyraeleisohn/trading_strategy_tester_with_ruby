import React, {Component} from 'react';
import PropTypes from 'prop-types';
import Exchange from './Exchange';

/**
 * Exchange list.
 */
class ExchangeList extends Component {
    /**
     * @type {{exchangeList: (*)}}
     */
    static propTypes = {
        exchangeList: PropTypes.arrayOf(PropTypes.shape({
            id: PropTypes.string.isRequired,
            status: PropTypes.string.isRequired,
            cycle_maximum: PropTypes.number.isRequired,
            finished_cycles: PropTypes.number.isRequired,
            time_spent: PropTypes.string.isRequired,
            percentage: PropTypes.number.isRequired,
            average_cycle_time: PropTypes.string.isRequired,
        }).isRequired).isRequired,
    };

    /**
     * @return {XML}
     */
    render() {
        if (this.props.exchangeList.length === 0) {
            return null;
        }
        return (
            <div className="exchangeList">
                <div className="panel panel-default">
                    <div className="panel-heading">Active exchanges</div>
                    <div className="panel-body">
                        <p>List of the currently running exchanges</p>
                    </div>
                    <table className="table table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>Status</th>
                            <th>Time</th>
                            <th>Average cycle time</th>
                            <th>Progress</th>
                        </tr>
                        </thead>
                        <tbody>
                        {this.props.exchangeList.map((exchange) =>
                            <Exchange key={exchange.id} exchange={exchange}/>
                        )}
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
}

export default ExchangeList;
