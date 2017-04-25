import React from 'react';
import Statistic from './statistic.jsx';
import TradeList from './trade_list.jsx';
import BalanceChart from './balance_chart.jsx';
import IndicatorGroup from './indicator_group.jsx';

class Strategy extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            data: {
                parameter_list: [],
                chart_id: null,
                indicator_list_id: null,
            }
        };
    }

    loadDataFromServer() {
        $.ajax(
            {
                url: this.props.url + '/' + this.props.dataId ,
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
        var strategy = this.state.data;
        var parameterList = JSON.stringify(strategy.parameter_list);

        return (
            <div className="strategy row-fluid">
                <div className="col-md-12">
                    <h1>Strategy</h1>
                    <div className="col-md-6">
                        <div className="description col-md-12">
                            <h2>Strategy Description</h2>
                            <table className="table table-hover table-condensed">
                                <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td>{strategy.name}</td>
                                </tr>
                                <tr>
                                    <th>Parameter list</th>
                                    <td>{parameterList}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <BalanceChart dataId={strategy.chart_id} url="/strategy_charts" pollInterval="100000"/>
                    </div>
                    <Statistic dataId={this.props.dataId} url="/strategy_statistics" pollInterval="100000"/>
                    <IndicatorGroup dataId={strategy.indicator_list_id} url="/strategy_indicator_lists" pollInterval="100000"/>
                    <TradeList dataId={this.props.dataId} url="/strategies" pollInterval="100000"/>
                </div>
            </div>
        );
    }
}

export default Strategy;