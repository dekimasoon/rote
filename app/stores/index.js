import {Deck, DeckStore} from './deck.js'
import {Card} from './card.js'
import {DeviceStore} from './device.js'

export const Model = {
  Deck,
  Card
}

let deckStore = new DeckStore()
let deviceStore = new DeviceStore()

export const store = {
  deck: deckStore,
  device: deviceStore
}
