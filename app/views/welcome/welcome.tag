require('./subviews/deck.tag')

<welcome>

  <div name="headerBox">
    <h2>Learn by Rote</h2>
    <p>こんにちは<br>最近がんばっていますね<br>今日も丸暗記していきましょう</p>
  </div>

  <div name="deckList">
    <deck each={ deck in decks }
          detail={ deck }
    </deck>
  </div>

  <script type="es6">
    import {store} from 'stores'
    
    this.on('mount', () => {
      this.decks = store.deck.state.decks
      this.update()
    })

    this.on('unmount', () => {
      store.deck.cancel(this.deckUpdated)
    })

  </script>

  <style type="stylus">
    @import '~app.styl'
    welcome
      display block
      padding 24px
      div[name=headerBox]
        text-align right
        h2
          margin 16px 0 24px
          font-size 1.12em
          font-weight normal
        p
          margin 0 0 32px
      div[name=deckList]
        text-align left
        border-top 1px dashed $color-border
  </style>

</welcome>
