var webpack = require('webpack');
var path = require('path');

var BUILD_DIR = path.resolve(__dirname, '../../app/assets/javascripts');
var APP_DIR = path.resolve(__dirname, 'app2');

var config = {
    entry: ["babel-polyfill", APP_DIR + '/main.js'],
    output: {
        path: BUILD_DIR,
        filename: 'bundle.js'
    },
    module : {
        loaders : [
            {
                test : /\.jsx?/,
                include : APP_DIR,
                loader : 'babel-loader',
                query: {
                    presets: [
                        'es2015',
                        'react',
                        'stage-2'
                    ]
                }
            }
        ],
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: [
                    "babel-loader",
                    "eslint-loader",
                ],
            }
        ],
    }
};

module.exports = config;