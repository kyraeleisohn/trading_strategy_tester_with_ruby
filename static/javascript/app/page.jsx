import React from 'react';

class Page extends React.Component {
    render() {
        page = this.props.data
        return (
            <li>
                <a href="{page.url}">{page.page_number}</a>
            </li>
        );
    }
}