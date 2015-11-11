require('components/ex-button.tag')

<deck class="bordered">

  <p name="name">{ detail.name }</p>
  <p>勉強したセンテンス数 { detail.sentences.length }</p>
  <p>暗記率 約{ detail.achievement}%</p>
  <div>
    <ex-button>詳細</ex-button>
    <ex-button onclick={ start }>始める</ex-button>
  </div>

  <script type="es6">
    this.detail = this.opts.detail
    this.start = () => {
      riot.route('card')
    }
  </script>

  <style type="text/stylus" scoped>
    :scope
      display block
      overflow:hidden /* clearfix */
      padding 16px 2px
      border-bottom 1px solid
    p[name=name]
      margin-bottom 12px
    div
      float right
      margin-top 8px
  </style>

</deck>
