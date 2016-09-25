import React from 'react';
import StrategyList from './strategy_list.jsx';
import ExchangeList from './exchange_list.jsx';

class Content extends React.Component{
    render() {
        return (
            <div className="content">
                <ExchangeList url="/exchange_statuses?q=status:processing" pollInterval="2000"/>
                <StrategyList url="/strategy_statistics" pollInterval="2000"/>
            </div>
        );
    }
}