import React, {Component} from 'react';
import PropTypes from 'prop-types';
import ActiveStatistic from '../containers/ActiveStatistic';
import ActiveTradeList from '../containers/ActiveTradeList';
import ActiveIndicatorGroup from '../containers/ActiveIndicatorGroup';

/**
 * Strategy.
 */
class Strategy extends Component {
    /**
     * @type {{exchange: (*)}}
     */
    static propTypes = {
        strategy: PropTypes.shape({
            id: PropTypes.string.isRequired,
            name: PropTypes.string.isRequired,
            chart_id: PropTypes.string.isRequired,
            parameter_list: PropTypes.string.isRequired,
            indicator_chart_id_list: PropTypes.array.isRequired,
        }).isRequired,
    };

    /**
     * @return {XML}
     */
    render() {
        return (
            <div className="strategy row-fluid">
                <div className="col-md-12">
                    <h1>Strategy</h1>
                    <div className="col-md-6">
                        <div className="description col-md-12">
                            <h2>Strategy Description</h2>
                            <table
                                className="table table-hover table-condensed"
                            >
                                <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td>{this.props.strategy.name}</td>
                                </tr>
                                <tr>
                                    <th>Parameter list</th>
                                    <td>
                                        {this.props.strategy.parameter_list}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <ActiveIndicatorGroup
                            dataIdList={[this.props.strategy.chart_id]}
                        />
                    </div>
                    <ActiveStatistic
                        dataId={this.props.strategy.id}
                    />
                    <ActiveIndicatorGroup
                        dataIdList={this.props.strategy.indicator_chart_id_list}
                    />
                    <ActiveTradeList
                        dataId={this.props.strategy.id}
                    />
                </div>
            </div>
        );
    }
}

export default Strategy;
