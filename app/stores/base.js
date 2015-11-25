export default class StoreBase {

  constructor(state) {
    riot.observable(this)
    this._state = state
  }

  _updated() {
    this.trigger('updated')
  }

  _addDependency(store, callback) {
    callback()
    store.listen(() => {
      callback()
    })
  }

  get state() {
    return this._state
  }

  listen(callback) {
    this.on('updated', callback)
  }

  cancel(callback) {
    this.off('updated', callback)
  }

}
