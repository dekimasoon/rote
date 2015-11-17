<newcard>

  <div>
    <p>新しいセンテンスを覚えましょう</p>
    <p>3回書いて予習してから</p>
    <p>追加してください</p>
  </div>
  <div>
    <textarea name="question" placeholder="Q."></textarea>
  </div>
  <div>
    <textarea name="answer" placeholder="A."></textarea>
  </div>
  <div>
    <ex-button>これ以上追加しない</ex-button>
    <ex-button>追加</ex-button>
  </div>

  <script type="es6">
    this.on('update', () => {
      this.card = this.opts.detail
    })
  </script>

  <style type="stylus">
    @import '~app.styl'
    newcard
      display block
      height 100%
      > div:nth-of-type(1)
        margin 4% 0
        text-align: right
      > div:nth-of-type(2)
        height 28%
        padding 6% 2px
        border-bottom 1px dashed $color-border
      > div:nth-of-type(3)
        height 28%
        padding 6% 2px
      > div:nth-of-type(4)
        float right
        ex-button
          @extend $button-border
      textarea
        width 100%
        height 100%
        resize none
        padding 12px
        line-height 1.2em
        border-radius 12px
        background-color $color-light
        -webkit-tap-highlight-color transparent
        &:focus
          outline 0
  </style>

</newcard>
