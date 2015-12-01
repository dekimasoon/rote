require('./subviews/newcard.tag')
require('./subviews/reviewcard.tag')

<learning>

  <div>
    <p>No. { card.number }
      <ro-progress stage={ card.stage }/>
    </p>
  </div>
  <ex-replaceable/> <!-- newcard or reviewcard -->
  <ex-button name="cancel" onclick={ cancel } if={ !isKeyboardShowing }>
    <ex-image file={ $image.cancel } ratio=3></ex-image>
  </ex-button>

  <script type="es6">
    import snabbt from 'snabbt.js'
    import {store} from 'stores'

    this.isReviewing = false
    this.cardStore = store.deck.state.learningDeck.cardStore

    this.cardStore.listen(this.cardUpdated = () => {
      this.card = this.cardStore.state.learningCard
      let replaceView = (oldView, newView) => {
        oldView.parentNode.insertBefore(newView, oldView.nextSibling)
        let or = oldView.getBoundingClientRect()
        let nr = newView.getBoundingClientRect()
        let motionWidth = window.innerWidth
        if (or.width) {
          snabbt(oldView, {
            fromPosition: [0, 0, 0],
            position: [-motionWidth, 0, 0],
            duration: 300,
            easing: 'easeOut'
          })
          snabbt(newView, {
            fromPosition: [motionWidth + or.left - nr.left, or.top - nr.top, 0],
            position: [0, or.top - nr.top, 0],
            duration: 300,
            easing: 'easeOut',
            complete: () => {
              oldView.parentNode.removeChild(oldView)
              newView.style.transform = ''
              newView.style.WebkitTransform = ''
            }
          })
        } else {
          oldView.parentNode.removeChild(oldView)
        }
        return newView
      }
      let oldView = this.element || document.querySelector('ex-replaceable')
      let newViewName = this.card.stage === 0 ? 'newcard' : 'reviewcard'
      let newView = document.createElement(newViewName)
      this.element = replaceView(oldView, newView)
      riot.mount(this.element)
      this.update()
    })

    store.device.listenSoftKeyboardToggel(this.keyCb = isKeyShowing => {
      this.isKeyboardShowing = isKeyShowing
      this.update()
    })

    this.cancel = () => {
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
          > ro-progress
            float right
      > newcard, reviewcard
        height 94%
      > [name="cancel"]
        position fixed
        bottom 20px
        right 20px
  </style>

</learning>
