export default class StoreBase {

  constructor(state) {
    riot.observable(this)
    this._state = state
  }

  _triggerUpdated() {
    this.trigger('updated', this.state)
  }

  _addDependency(store, callback) {
    callback(store.state)
    store.on(state => {
      callback(state)
    })
  }

  get state() {
    return this._state
  }

  refresh() {
    this._triggerUpdated()
  }

  listen(callback) {
    this.on('updated', callback)
  }

  remove(callback) {
    this.off('updated', callback)
  }

}
