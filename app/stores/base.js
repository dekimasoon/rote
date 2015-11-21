export default class StoreBase {

  constructor(state, ...dependencies) {
    riot.observable(this)
    this._state = state
    dependencies.forEach(dependency => {
      dependency.onUpdated(() => {
        this._triggerUpdated()
      })
    })
  }

  get state() {
    return this._state
  }

  refresh() {
    this._triggerUpdated()
  }

  _triggerUpdated() {
    this.trigger('updated', this.state)
  }

  onUpdated(callback) {
    this.on('updated', callback)
  }

}
