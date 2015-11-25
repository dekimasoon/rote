require('./subviews/newcard.tag')
require('./subviews/reviewcard.tag')

<learning>

  <div>
    <p>No. { card.number }</p>
  </div>
  <reviewcard if={ isReviewing }></reviewcard>
  <newcard if={ !isReviewing }></newcard>
  <ex-button name="cancel" onclick={ stop } if={ !isKeyboardShowing }>
    <ex-image file={ $image.cancel } ratio=3></ex-image>
  </ex-button>

  <script type="es6">
    import {store} from 'stores'

    this.isCheated = false
    this.isReviewing = false
    this.cardStore = store.deck.state.learningDeck.cardStore

    this.cardStore.listen(this.cardUpdated = () => {
      this.card = this.cardStore.state.learningCard
      this.isReviewing = Boolean(this.card.stage)
      this.update()
    })

    store.device.listenSoftKeyboardToggel(this.isKeyCb = isKeyShowing => {
      console.log('key')
      this.isKeyboardShowing = isKeyShowing
      this.update()
    })

    this.stop = () => {
      riot.route('welcome')
    }

    this.on('mount', () => {
      this.cardStore.next()
    })

    this.on('unmount', () => {
      this.cardStore.cancel(this.cardUpdated)
      store.device.cancelSoftKeyboardToggel(this.isKeyCb)
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
