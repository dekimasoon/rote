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
    // Set window height by script.
    // So when software-keyboard showed up,
    // the window height is not resized or affected.
    document.body.style.height = `${window.innerHeight}px`
    // hide scroll bar
    document.body.style.overflow = 'hidden'

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
      overflow scroll
      -webkit-overflow-scrolling: touch
      -webkit-tap-highlight-color: rgba(0, 0, 0, 0)
  </style>

</app>
