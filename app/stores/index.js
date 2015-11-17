import {DeckAction, DeckEvent, Deck, Card, DeckStore} from './deck.js'
import {DeviceEvent, DeviceStore} from './device.js'

dispatcher.addStore(new DeckStore())
dispatcher.addStore(new DeviceStore())

export const Model = {
  Deck,
  Card
}

export const Action = {
  Deck: DeckAction
}

export const Event = {
  Deck: DeckEvent,
  Device: DeviceEvent
}
