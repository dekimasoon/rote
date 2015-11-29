<ex-textarea>

  <textarea name="input" placeholder={ opts.placeholder } oninput={ onInput }></textarea>

  <script type="es6">

    const VA_NAME = /^(EX-TEXTAREA|EX-INPUT)$/
    const VA_CLASS = /\sva-(init|valid|fail)/

    function findTarget(child, name) {
      if (child.parent) {
        if (child.parent[name] && VA_NAME.test(child.parent[name].tagName)) {
          return child.parent
        }
        return findTarget(child.parent, name)
      }
      throw new Error('unexpected')
    }

    function validateTag(tag) {
      let isValid = tag.opts.validate(tag.input.value)
      let tagClass = isValid ? ' va-valid' : ' va-fail'
      tag.root.className = tag.root.className.replace(VA_CLASS, tagClass)
      return isValid
    }

    function initVaTags(target) {
      // make sure initVaTags() excuted only once
      if (target.$va) {
        return
      }

      target.$va = {}
      let vaTags = []
      Object.keys(target.tags).forEach(key => {
        let tag = target.tags[key]
        if (tag.root && VA_NAME.test(tag.root.tagName)) {
          tag.root.className += ' va-init'
          target.$va[key] = 1
          vaTags.push(tag)
        }
      })
      target.$va.all = () => {
        let results = []
        vaTags.forEach(tag => {
          let isValid = validateTag(tag)
          target.$va[tag.opts.name] = isValid
          results.push(isValid)
        })
        return results.indexOf(false) < 0
      }
    }

    let target = findTarget(this, this.opts.name)
    initVaTags(target)

    let validateTimer
    this.onInput = () => {
      this.root.value = this.input.value
      clearTimeout(validateTimer)
      validateTimer = setTimeout(() => {
        let isValid = validateTag(this)
        target.$va[this.opts.name] = isValid
        target.trigger('validate', target.$va)
      }, 400)
    }

  </script>

  <style>
    ex-textarea {
      display: inline-block;
    }
    ex-textarea > textarea {
      height: 100%;
      width: 100%;
      resize: inherit;
      -webkit-tap-highlight-color: inherit;
    }
    ex-textarea > textarea:focus {
      outline: inherit;
    }
  </style>

</ex-textarea>
