import React from 'react';
import {render} from 'react-dom';
import Root from './routes/Dashboard/containers/Root';
import {fetchApplication} from './routes/Dashboard/modules/actions';

fetchApplication();

render(
    <Root />,
    document.getElementById('root')
);
