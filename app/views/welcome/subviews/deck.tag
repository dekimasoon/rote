<deck>

  <p name="name">{ deck.name }</p>
  <p>勉強したセンテンス数 { deck.cards.length }</p>
  <p>暗記率 約{ deck.achievement }%</p>
  <div>
    <ex-button>詳細</ex-button>
    <ex-button onclick={ start }>始める</ex-button>
  </div>

  <script type="es6">
    import {store} from 'stores'

    this.deck = this.opts.detail

    this.start = () => {
      store.deck.select(this.deck.id)
      riot.route('learning')
    }

  </script>

  <style type="stylus">
    @import '~app.styl'
    deck
      display block
      overflow hidden // clearfix
      padding 16px 2px
      border-bottom 1px dashed $color-border
      > [name=name]
        margin-bottom 12px
      > div
        float right
        margin-top 8px
      ex-button
        @extend $button-border
  </style>

</deck>
