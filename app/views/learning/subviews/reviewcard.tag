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
  <div show={ !isForgotten }>
    <ex-button onclick={ forgotten }>忘れた</ex-button>
    <ex-button onclick={ remembered } >覚えてる</ex-button>
  </div>
  <div show={ isForgotten }>
    <p>忘れるのは仕方ありませんよね<br>3回書いて復習しましょう</p>
    <ex-button onclick={ reviewed }>復讐した</ex-button>
  </div>

  <script type="es6">
    import {store} from 'stores'

    this.cardStore = store.deck.state.learningDeck.cardStore

    this.toggleAnswer = () => {
      this.isCheated = !this.isCheated
      this.update()
    }

    this.remembered = () => {
      this.cardStore.remembered().then(() => {
        this.cardStore.next()
      })
    }

    this.forgotten = () => {
      this.cardStore.forgotten().then(() => {
        this.isForgotten = !this.isForgotten
        this.update()
      })
    }

    this.reviewed = () => {
      this.cardStore.next()
    }

    this.on('update', () => {
      this.card = this.cardStore.state.learningCard
    })

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
      > div:nth-of-type(3), div:nth-of-type(4)
        text-align right
        float right
        margin-top 8px
        ex-button
          @extend $button-border
        p
          margin-bottom 12px
  </style>

</reviewcard>
