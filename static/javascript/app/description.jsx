import React from 'react';

class Description extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            data: {
            }
        };
    }

    loadDataFromServer() {
        $.ajax(
            {
                url: this.props.url + '/' + this.props.dataId ,
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
        var description = this.state.data
        var parameterList = JSON.stringify(description.parameter_list)

        return (
            <div className="description col-md-6">
                <h2>Strategy Description</h2>
                <table className="table table-hover table-condensed">
                    <tbody>
                    <tr>
                        <th>Name</th>
                        <td>{description.name}</td>
                    </tr>
                    <tr>
                        <th>Parameter list</th>
                        <td>{parameterList}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        );
    }
}

export default Description;