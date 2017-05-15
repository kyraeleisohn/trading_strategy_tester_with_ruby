import {createStore, applyMiddleware} from 'redux';
import createSagaMiddleware from 'redux-saga';
import createLogger from 'redux-logger';
import reducers from './reducers';
import sagas from './sagas';

const sagaMiddleware = createSagaMiddleware();
const loggerMiddleware = createLogger();

/**
 * @param {object} preloadedState
 *
 * @return {Store<S>}
 */
export default function configureStore(preloadedState) {
    let store = createStore(
        reducers,
        preloadedState,
        applyMiddleware(
            sagaMiddleware,
            loggerMiddleware
        )
    );

    sagaMiddleware.run(sagas);

    return store;
}
