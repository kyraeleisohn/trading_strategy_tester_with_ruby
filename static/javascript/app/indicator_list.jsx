import React from 'react';
import Indicator from './indicator.jsx';

class IndicatorList extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            data: {
                id: '',
                item_id_list: []
            }
        };
    }

    loadDataFromServer() {
        $.ajax(
            {
                url: this.props.url + '/' + this.props.dataId,
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
        var indicatorList = this.state.data.item_id_list.map(
            function(item_id) {
                return (
                    <Indicator dataId={item_id} url="/strategy_indicators" pollInterval="20000"/>
                );
            }
        );

        return (
            <div className="indicatorList">
                {indicatorList}
            </div>
        );
    }
}

export default IndicatorList;