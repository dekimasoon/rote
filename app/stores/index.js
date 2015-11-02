import {DeckAction, DeckEvent, Deck, DeckStore} from './deck.js'

dispatcher.addStore(new DeckStore())

export const Model = {
  Deck
}

export const Action = {
  Deck: DeckAction
}

export const Event = {
  Deck: DeckEvent
}
