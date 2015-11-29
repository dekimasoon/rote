<card>

  <p onclick={ toggle }>{ sentence }</p>
  <p><ro-progress stage={ card.stage }/></p>

  <script type="es6">
    this.card = this.opts.detail
    this.sentence = this.card.question
    this.toggle = () => {
      this.sentence = this.sentence == this.card.question ? this.card.answer : this.card.question
    }
  </script>

  <style type="stylus">
    @import '~app.styl'
    card
      display block
      overflow hidden // clearfix
      padding 16px 2px
      border-bottom 1px dashed $color-border
      > p:nth-of-type(1)
        margin-bottom 8px
      > p:nth-of-type(2)
        float right
  </style>

</card>
