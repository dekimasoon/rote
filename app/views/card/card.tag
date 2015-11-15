require('components/ex-image.tag')

<card>

  <p>No. { card.number }</p>
  <div>
    <p>{ card.question }</p>
  </div>
  <div>
    <p>{ card.answer }</p>
  </div>
  <div>
    <ex-button>忘れた</ex-button>
    <ex-button>覚えてる</ex-button>
  </div>
  <ex-button name="cancel" onclick={ stop }>
    <ex-image file={ $image.cancel } ratio=3></ex-image>
  </ex-button>

  <script type="es6">
    import {Action, Event} from 'stores'

    this.on('mount', () => {
      // for dev
      dispatcher.trigger(Action.Deck.Init)
      dispatcher.trigger(Action.Deck.GetCard)
    })
    this.stop = () => {
      riot.route('welcome')
    }
    dispatcher.on(Event.Deck.CardUpdated, card => {
      this.card = card
      this.update()
    })
  </script>

  <style type="stylus">
    @import '~app.styl'
    card
      display block
      height 100%
      padding 24px
      > p
        margin-top 16px
        font-size 0.6em
        color $color-acc
      > div
        &:nth-of-type(1)
          border-bottom 1px solid $color-border
        &:nth-of-type(-n+2)
          height 32%
          font-size 1.12em
          > p
            // go app.styl
            position relative
            top 50%
            -webkit-transform: translateY(-50%);
            transform translateY(-50%)
        &:nth-of-type(3)
          float right
          margin-top 8px
          ex-button
            @extend $button-text
      ex-button[name="cancel"]
        position fixed
        bottom 24px
        right 20px
  </style>

</card>
