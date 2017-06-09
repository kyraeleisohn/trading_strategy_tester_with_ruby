/**
 * @param {object} strategy
 *
 * @return {{id, name, parameter_list, indicator_chart_id_list}}
 */
export default function strategy(strategy) {
    return {
        id: strategy.id,
        name: strategy.name,
        chart_id: strategy.chart_id,
        parameter_list: JSON.stringify(strategy.parameter_list),
        indicator_chart_id_list: strategy.indicator_chart_id_list,
    };
}
