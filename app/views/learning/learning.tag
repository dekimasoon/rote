require('./subviews/newcard.tag')
require('./subviews/reviewcard.tag')

<learning>

  <div>
    <p>No. { card.number }</p>
  </div>
  <reviewcard detail={ card } if={ isReviewing }></reviewcard>
  <newcard if={ !isReviewing }></newcard>
  <ex-button name="cancel" onclick={ stop } if={ !isKeyboardShowing }>
    <ex-image file={ $image.cancel } ratio=3></ex-image>
  </ex-button>

  <script type="es6">
    import {Action, Event} from 'stores'

    this.isCheated = false
    this.isReviewing = false
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
      this.isReviewing = Boolean(card.id)
      this.update()
    })
    dispatcher.on(Event.Device.SoftKeybord, isKeyboardShowing => {
      this.isKeyboardShowing = isKeyboardShowing
      this.update()
    })
  </script>

  <style type="stylus">
    @import '~app.styl'
    learning
      display block
      height 100%
      padding 24px
      > div
        height 6%
        font-size 0.6em
        color $color-acc
        > p
          @extend $vertical-align-bottom
      > newcard, reviewcard
        height 94%
      > [name="cancel"]
        position fixed
        bottom 20px
        right 20px
  </style>

</learning>
