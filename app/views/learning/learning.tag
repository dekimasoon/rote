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
    import {Store} from 'stores'

    this.isCheated = false
    this.isReviewing = false
    this.on('mount', () => {
      Store.Card.next()
    })
    this.stop = () => {
      riot.route('welcome')
    }
    Store.Card.onUpdated(state => {
      this.card = state.learningCard
      this.isReviewing = Boolean(this.card.id)
      this.update()
    })
    Store.Device.onSoftKeyboardToggel(isKeyboardShowing => {
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
