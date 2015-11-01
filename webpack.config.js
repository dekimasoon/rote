var webpack = require('webpack');
var HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: './app/index',
  output: {
    path: __dirname + '/dist',
    filename: 'bundle.js'
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './app/index.tmpl.html',
    }),
    new webpack.ProvidePlugin({
      riot: 'riot'
    })
  ],
  resolve: {
    extensions: ['', '.tag', '.js'],
    root: __dirname + '/app'
  },
  module: {
    preLoaders: [
      { test: /\.tag$/, include: /app/, loader: 'riotjs' }
    ],
    loaders: [
      { test: /\.js$|\.tag$/, include: /app/, loader: 'babel' }
    ]
  },
  devServer: {
    contentBase: __dirname + '/dist'
  }
};
