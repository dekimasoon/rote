<reviewcard>

  <div>
    <p>{ card.question }</p>
  </div>
  <div>
    <ex-button if={ !isCheated } onclick={ toggleAnswer }>
      タップして答えを表示
    </ex-button>
    <p if={ isCheated } onclick={ toggleAnswer }>
      { card.answer }
    </p>
  </div>
  <div>
    <ex-button onclick={ forgotten }>忘れた</ex-button>
    <ex-button onclick={ remembered } >覚えてる</ex-button>
  </div>

  <script type="es6">
    this.isCheated = false
    this.on('update', () => {
      this.card = this.opts.detail
    })
    this.toggleAnswer = () => {
      this.isCheated = !this.isCheated
    }
    this.remembered = () => {
      this.card.repeated++
    }
  </script>

  <style type="stylus">
    @import '~app.styl'
    reviewcard
      display block
      height 100%
      > div:nth-of-type(-n+2)
        height 32%
        padding 0 4px
        font-size 1.12em
        > p, ex-button
          @extend $vertical-align-middle
      > div:nth-of-type(1)
        border-bottom 1px solid $color-border
      > div:nth-of-type(2)
        text-align center
        > ex-button
          @extend $button-round
          margin 0 auto
        > p
          text-align left
      > div:nth-of-type(3)
        float right
        margin-top 8px
        ex-button
          @extend $button-border
  </style>

</reviewcard>
