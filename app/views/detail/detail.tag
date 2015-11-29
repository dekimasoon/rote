require('./subviews/card.tag')

<detail>

  <div name="headerBox">
    <h2>{ deck.name }</h2>
    <p>暗記したセンテンス数 { deck.cards.length }<br>暗記率 { deck.achievement }%</p>
  </div>
  <div name="cardList">
    <card each={ card in deck.cards }
          detail={ card }
    </card>
  </div>
  <ex-button name="cancel" onclick={ cancel }>
    <ex-image file={ $image.cancel } ratio=3></ex-image>
  </ex-button>

  <script type="es6">
    import {store} from 'stores'

    this.cancel = () => {
      riot.route('welcome')
    }

    this.on('mount', () => {
      this.deck = store.deck.state.learningDeck
      this.update()
    })
  </script>

  <style type="stylus">
    @import '~app.styl'
    detail
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
      div[name=cardList]
        text-align left
        border-top 1px dashed $color-border
      > [name="cancel"]
        position fixed
        bottom 20px
        right 20px
  </style>

</detail>
