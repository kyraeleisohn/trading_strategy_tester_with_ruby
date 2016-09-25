import React from 'react';

class Pager extends React.Component {
    render() {
        pager = this.props.data

        var pages = pager.pages.map(
            function(trade) {
                return (
                    <Page data={trade} />
                );
            }
        );

        return (
            <div className="pagination pagination-centered">
                <ul>
                    <li>
                        <a href="{pager.prev_page_url}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    {pages}
                    <li>
                        <a href="{pager.next_page_url}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </div>
        );
    }
}

export default Pager;