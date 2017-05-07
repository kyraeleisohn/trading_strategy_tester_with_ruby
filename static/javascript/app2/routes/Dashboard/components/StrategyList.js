import React, {Component} from 'react';
import PropTypes from 'prop-types';
import Strategy from './Strategy';

/**
 * Strategy list.
 */
class StrategyList extends Component {
    /**
     * @type {{strategyList: (*)}}
     */
    static propTypes = {
        strategyList: PropTypes.arrayOf(PropTypes.shape({
            id: PropTypes.string.isRequired,
        }).isRequired).isRequired,
    };

    /**
     * @return {XML}
     */
    render() {
        if (this.props.strategyList.length === 0) {
            return null;
        }
console.log(this.props.strategyList);
        return (
            <div className="strategyList">
                {this.props.strategyList.map((strategy) =>
                    <Strategy key={strategy.id} strategy={strategy}/>
                )}
            </div>
        );
    }
}

export default StrategyList;
