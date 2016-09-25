import Page from './page.jsx';
import Pager from './pager.jsx';
import StrategyList from './strategy_list.jsx';
import ExchangeList from './exchange_list.jsx';

var Content = React.createClass(
    {
        render: function() {
            return (
                <div className="content">
                <ExchangeList url="/exchange_statuses?q=status:processing" pollInterval="2000"/>
                <StrategyList url="/strategy_statistics" pollInterval="2000"/>
                </div>
            );
        }
    }
);
ReactDOM.render(
<Content/>,
    document.getElementById('content')
);