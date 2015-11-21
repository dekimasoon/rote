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
      template: './app/index.tmpl.html'
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
    loaders: [
      { test: /\.tag$/, include: /app/, loader: 'riotjs!riotjs-style-plus' },
      { test: /\.js$/, include: /app/, loader: 'babel' },
      { test: /\.styl$/, include: /app/, loader: 'style!css?minimize!stylus' },
      { test: /\.css$/, include: /node_modules/, loader: 'style!css' },
      { test: /\.png$|\.jpg$/, include: /app/, loader: 'file?name=[path][name].[ext]' }
    ]
  },
  devServer: {
    contentBase: __dirname + '/dist'
  }
};
