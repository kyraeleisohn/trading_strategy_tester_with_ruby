import React, {Component} from 'react';
import {Provider} from 'react-redux';
import configureStore from '../../../store/configureStore';
import ActiveExchangeList from './ActiveExchangeList';
import ActiveStrategyList from './ActiveStrategyList';

let store = configureStore();

/**
 * Root application container.
 */
class Root extends Component {
    /**
     * @return {XML}
     */
    render() {
        return (
            <Provider store={store}>
                <div>
                    <ActiveExchangeList />
                    <ActiveStrategyList />
                </div>
            </Provider>
        );
    }
}

export default Root;
