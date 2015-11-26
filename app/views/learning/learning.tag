require('./subviews/newcard.tag')
require('./subviews/reviewcard.tag')

<learning>

  <div>
    <p>No. { card.number }</p>
  </div>
  <ex-replaceable/> <!-- newcard or reviewcard -->
  <ex-button name="cancel" onclick={ stop } if={ !isKeyboardShowing }>
    <ex-image file={ $image.cancel } ratio=3></ex-image>
  </ex-button>

  <script type="es6">
    import {store} from 'stores'

    this.isReviewing = false
    this.cardStore = store.deck.state.learningDeck.cardStore

    this.cardStore.listen(this.cardUpdated = () => {
      this.card = this.cardStore.state.learningCard
      let replaceElement = (target, element) => {
        target.parentNode.insertBefore(element, target)
        target.parentNode.removeChild(target)
        return element
      }
      let replace = this.element || document.querySelector('ex-replaceable')
      let view = this.card.stage === 0 ? 'newcard' : 'reviewcard'
      let newElement = document.createElement(view)
      this.element = replaceElement(replace, newElement)
      riot.mount(this.element)
      this.update()
    })

    store.device.listenSoftKeyboardToggel(this.keyCb = isKeyShowing => {
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
      store.device.cancelSoftKeyboardToggel(this.keyCb)
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
