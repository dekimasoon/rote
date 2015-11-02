require('./deck/deck.tag')

<welcome>

  <div name="headerBox">
    <h2>Learn by Rote</h2>
    <p>こんにちは<br>最近がんばっていますね<br>今日も丸暗記していきましょう</p>
  </div>

  <div name="deckList" class="bordered">
    <deck each={ deck in decks }
          detail={ deck }
    </deck>
  </div>

  <script type="es6">
    import {Action, Event} from 'stores'

    this.on('mount', () => {
      dispatcher.trigger(Action.Deck.Init)
    })

    dispatcher.on(Event.Deck.Updated, decks => {
      this.decks = decks
      this.update()
    })
  </script>

  <style type="text/stylus" scoped>
    :scope
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
      border-top 1px solid
  </style>

</welcome>
