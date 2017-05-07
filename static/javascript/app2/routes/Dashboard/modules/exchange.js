/**
 * @param {number} secondCount
 *
 * @return {string}
 */
function formatTimeInterval(secondCount) {
    let hours = Math.floor(secondCount / 3600);
    let minutes = Math.floor((secondCount - (hours * 3600)) / 60);
    let seconds = secondCount - (hours * 3600) - (minutes * 60);
    let result = '';

    if (hours) {
        result = result + hours + ' hour(s) ';
    }
    if (minutes) {
        result = result + minutes + ' minute(s) ';
    }
    if (seconds) {
        result = result + seconds + ' second(s) ';
    }

    return result;
}

/**
 * @param {number} current
 * @param {number} maximum
 *
 * @return {number}
 */
function calculatePercentage(current, maximum) {
    return Math.floor((current / maximum) * 100);
}

/**
 * @param {object} exchange
 *
 * @return {{
 *  id,
 *  status,
 *  cycle_maximum: *,
 *  finished_cycles: *,
 *  time_spent: string,
 *  percentage: number,
 *  average_cycle_time: string
 * }}
 */
export default function exchange(exchange) {
    let percentage = calculatePercentage(
        exchange.finished_cycles,
        exchange.cycle_maximum
    );
    let averageCycleTime = formatTimeInterval(
        exchange.time_spent / exchange.finished_cycles
    );

    return {
        id: exchange.id,
        status: exchange.status,
        cycle_maximum: exchange.cycle_maximum,
        finished_cycles: exchange.finished_cycles,
        time_spent: formatTimeInterval(exchange.time_stamp),
        percentage: percentage,
        average_cycle_time: averageCycleTime,
    };
}
