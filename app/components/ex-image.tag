<ex-image>

  <img name="img">

  <script type="es6">
    if (this.opts.ratio) {
      this.img.style.display = 'none'
      this.img.onload = () => {
        this.img.style.width = `${this.img.naturalWidth / this.opts.ratio}px`
        this.img.style.height = `${this.img.natualHeight / this.opts.ratio}px`
        this.img.style.display = ''
      }
    }
    if (this.opts.file) {
      this.img.src = this.opts.file
    }
  </script>

</ex-image>
