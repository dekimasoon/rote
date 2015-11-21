import {Deck, DeckStore} from './deck.js'
import {Card, CardStore} from './card.js'
import {DeviceStore} from './device.js'

export const Model = {
  Deck,
  Card
}

let deckStore = new DeckStore()
let cardStore = new CardStore(deckStore)
let deviceStore = new DeviceStore()

export const Store = {
  Deck: deckStore,
  Card: cardStore,
  Device: deviceStore
}
