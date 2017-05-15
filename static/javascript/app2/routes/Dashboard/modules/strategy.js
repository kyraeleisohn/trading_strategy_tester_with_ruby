/**
 * @param {object} strategy
 *
 * @return {{id, name, parameter_list: (*|Array)}}
 */
export default function strategy(strategy) {
    return {
        id: strategy.id,
        name: strategy.name,
        parameter_list: JSON.stringify(strategy.parameter_list),
    };
}
