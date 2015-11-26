<ro-progress>

  <span style=background-position:{ '0 ' +-(opts.stage || 0) * 6 + 'px' }></span>

  <style type="stylus">
    ro-progress
      display inline-block
      width 68px
      height 6px
      span
        display inline-block
        width 68px
        height 6px
        background url('~images/progress@3x.png')
        background-size 68px 36px
  </style>

</ro-progress>
