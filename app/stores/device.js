export const DeviceAction = {
}

export const DeviceEvent = {
  SoftKeybord: 'DeviceSoftKeybord'
}

export class DeviceStore {
  constructor() {
    riot.observable(this)
    // add window event listner
    let initialWindowHeight = window.innerHeight
    window.addEventListener('resize', () => {
      let isKeyboardShowing = initialWindowHeight > window.innerHeight
      this.trigger(DeviceEvent.SoftKeybord, isKeyboardShowing)
    })
  }
}
