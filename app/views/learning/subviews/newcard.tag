<newcard>

  <div>
    <p>新しいセンテンスを覚えましょう</p>
    <p>3回書いて予習してから</p>
    <p>追加してください</p>
  </div>
  <div>
    <ex-textarea name="question" placeholder="Q." validate={ validator }></ex-textarea>
  </div>
  <div>
    <ex-textarea name="answer" placeholder="A." validate={ validator } class="sample"></ex-textarea>
  </div>
  <div>
    <ex-button onclick={ pause } if={ showPause }>これ以上追加しない</ex-button>
    <ex-button onclick={ add }>追加</ex-button>
  </div>

  <script type="es6">
    import {store} from 'stores'

    let cardStore = store.deck.state.learningDeck.cardStore

    this.add = () => {
      if (this.$va.all()) {
        cardStore.add(this.question.value, this.answer.value)
        cardStore.next()
      }
    }

    this.pause = () => {
      store.deck.pause().then(() => {
        cardStore.next()
      })
    }

    this.showPause = cardStore.state.cards.length > 0

    this.validator = value => {
      return /.+/.test(value)
    }

    this.on('validate', () => {
      this.update()
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
      ex-textarea
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
        &.va-fail
          border solid 1px pink
    </style>

</newcard>
