import fetch from 'isomorphic-fetch';

/**
 *
 */
export default class Api {
    /**
     * @return {*}
     */
    static fetchExchange() {
        return fetch('/exchange_statuses?q=status:processing')
            .then((response) => response.json())
        ;
    };

    /**
     * @return {*}
     */
    static fetchStrategyList() {
        return fetch('/strategies')
            .then((response) => response.json())
        ;
    };

    /**
     * @param {string} id
     *
     * @return {*}
     */
    static fetchStatistic(id) {
        return fetch('/strategy_statistics/' + id)
            .then((response) => response.json())
        ;
    };

    /**
     * @param {string} id
     *
     * @return {*}
     */
    static fetchTradeList(id) {
        return fetch('/strategies/' + id + '/trades')
            .then((response) => response.json())
        ;
    };

    /**
     * @param {string} id
     *
     * @return {*}
     */
    static fetchIndicatorList(id) {
        return fetch('/strategy_indicator_lists/' + id)
            .then((response) => response.json())
        ;
    };

    /**
     * @param {string} id
     *
     * @return {*}
     */
    static fetchIndicator(id) {
        return fetch('/strategy_indicators/' + id)
            .then((response) => response.json())
        ;
    };

    /**
     * @param {string} id
     *
     * @return {*}
     */
    static fetchChart(id) {
        return fetch('/strategy_charts/' + id)
            .then((response) => response.json())
        ;
    };
}
