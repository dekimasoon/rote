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

</app>
