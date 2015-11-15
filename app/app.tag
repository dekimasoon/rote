require('sanitize.css/dist/sanitize.min.css')
require('./app.styl')
require('./views')

<app>

  <script type="es6">
    this.on('mount', () => {
      riot.route.start()
      riot.route.exec()
    })

    let root = this.root
    riot.route(view => {
      while (root.firstChild) {
        root.removeChild(root.firstChild)
      }
      let tag = document.createElement(view || 'welcome')
      root.appendChild(tag)
      riot.mount(tag)
    })

  </script>

  <style type="stylus">
    @import "./app.styl"
    html, body
      height 100%
    app
      display block
      height 100%
      font-family 'Lucida Grande', 'Hiragino Kaku Gothic ProN', 'Meiryo', 'メイリオ', 'sans-serif'
      font-size 16px
      letter-spacing -0.02em
      color $color-def
      border-color $color-def
  </style>

</app>
