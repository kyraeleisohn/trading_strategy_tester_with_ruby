import React from 'react';

class Exchange extends React.Component {
    formatTimeInterval(seconds_count) {
        var hours   = Math.floor(seconds_count / 3600);
        var minutes = Math.floor((seconds_count - (hours * 3600)) / 60);
        var seconds = seconds_count - (hours * 3600) - (minutes * 60);
        var result = '';

        if (hours)
        {
            result = result + hours + ' hour(s) '
        }
        if (minutes)
        {
            result = result + minutes + ' minute(s) '
        }
        if (seconds)
        {
            result = result + seconds + ' second(s) '
        }

        return result;
    }

    render() {
        var exchange = this.props.data;
        var percentage = Math.floor((exchange.finished_cycles / exchange.cycle_maximum) * 100);
        var time_spent = this.formatTimeInterval(exchange.time_spent);
        var average_cycle_time = this.formatTimeInterval(exchange.time_spent / exchange.finished_cycles);
        var divStyle = {
            width: percentage + '%',
        }

        return (
            <tr>
                <th>{exchange.status}</th>
                <th>{time_spent}</th>
                <th>{average_cycle_time}</th>
                <th>
                    <div className="progress">
                        <div className="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow={exchange.finished_cycles} aria-valuemin="0" aria-valuemax={exchange.cycle_maximum} style={divStyle}>
                            <span className="sr-only"> {percentage}% ({exchange.finished_cycles} / {exchange.cycle_maximum}) Completed </span>
                            {percentage}% ({exchange.finished_cycles} / {exchange.cycle_maximum}) Completed
                        </div>
                    </div>
                </th>
            </tr>
        );
    }
}

export default Exchange;