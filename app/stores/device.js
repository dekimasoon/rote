import StoreBase from './base.js'

const Event = {
  SoftKeyboardToggel: 'SoftKeyboardToggel'
}

export class DeviceStore extends StoreBase {

  constructor() {
    super()
    let initial = {
      windowHeight: window.innerHeight
    }
    // add window event listner
    window.addEventListener('resize', () => {
      let isKeyboardShowing = initial.windowHeight > window.innerHeight
      this.trigger(Event.SoftKeyboardToggel, isKeyboardShowing)
    })
  }

  listenSoftKeyboardToggel(callback) {
    this.on(Event.SoftKeyboardToggel, callback)
  }

  cancelSoftKeyboardToggel(callback) {
    this.off(Event.SoftKeyboardToggel, callback)
  }

}
