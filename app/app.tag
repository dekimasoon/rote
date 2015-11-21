<app>

  <script type="es6">
    this.on('mount', () => {
      riot.route.start()
      riot.route.exec()
    })

    let tags = []
    let root = this.root
    riot.route(view => {
      tags.forEach(tag => {
        tag.unmount()
      })
      let tag = document.createElement(view || 'welcome')
      root.appendChild(tag)
      tags = riot.mount(tag)
    })
    // set app window height by script
    // so when software-keyboard showed up,
    // the height is not resized or affected.
    document.body.style.height = `${window.innerHeight}px`

  </script>

  <style type="stylus">
    @import "./app.styl"
    app
      display block
      height 100%
      font-family 'Lucida Grande', 'Hiragino Kaku Gothic ProN', 'Meiryo', 'メイリオ', 'sans-serif'
      font-size 16px
      letter-spacing -0.04em
      color $color-def
      border-color $color-def
  </style>

</app>
