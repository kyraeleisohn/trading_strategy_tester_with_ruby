import React from 'react';
import Description from './description.jsx';
import Statistic from './statistic.jsx';
import TradeList from './trade_list.jsx';
import BalanceChart from './balance_chart.jsx';

class Strategy extends React.Component {
    render() {
        return (
            <div className="strategy row-fluid">
                <div className="col-md-12">
                    <h1>Strategy</h1>
                    <div className="col-md-6">
                        <Description dataId={this.props.dataId} url="/strategy_descriptions" pollInterval="2000"/>
                        <BalanceChart dataId={this.props.dataId} url="/strategy_descriptions" pollInterval="2000"/>
                    </div>
                    <Statistic dataId={this.props.dataId} url="/strategy_statistics" pollInterval="2000"/>
                    <TradeList dataId={this.props.dataId} url="/strategies" pollInterval="2000"/>
                </div>
            </div>
        );
    }
}

export default Strategy;