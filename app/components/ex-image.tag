<ex-image>

  <img name="image">

  <script type="es6">
    if (this.opts.ratio) {
      this.image.style.display = 'none'
      this.image.onload = () => {
        this.image.style.width = `${this.image.naturalWidth / this.opts.ratio}px`
        this.image.style.height = `${this.image.natualHeight / this.opts.ratio}px`
        this.image.style.display = ''
      }
    }
    this.image.src = this.opts.url
  </script>

</ex-image>
