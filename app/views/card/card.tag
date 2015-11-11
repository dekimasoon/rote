require('components/ex-image.tag')

<card>
  <p>Hello, This is Card view.</p>
  <ex-image url={ images.background } ratio=3></ex-image>
  <ex-image url={ images.cancel } ratio=3></ex-image>

  <script type="es6">
    this.images = require('images')
  </script>

</card>
