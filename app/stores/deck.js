import StoreBase from './base.js'
import uuid from 'node-uuid'
import {CardStore} from './card.js'

export class Deck {
  constructor(name) {
    this.id = uuid.v4()
    this.name = name
    this.created = new Date()
    this.updated = new Date()
    this.cardStore = new CardStore(this.id)
    this.cards = this.cardStore.state.cards
  }

  get achievement() {
    let achievement = 0
    this.cards.forEach(card => {
      achievement += (100 / this.cards.length) * (card.stage / 5)
    })
    return achievement
  }
}

export class DeckStore extends StoreBase {

  constructor() {
    super({
      decks: [],
      learningDeck: {}
    })
    if (!this._state.decks.length) {
      let deck = new Deck('例: Duo3.0全文')
      deck.id = uuid.v4()
      this._state.decks.push(deck)
      this._state.learningDeck = deck
    }
    this._updated()
  }

  add(deck) {
    return new Promise(resolve => {
      this._state.decks.push(deck)
      this._state.learningDeck = deck
      this._updated()
      resolve()
    })
  }

  select(id) {
    return new Promise(resolve => {
      this._state.learningDeck = this._state.decks.find(deck => {
        return deck.id === id
      })
      this._updated()
      resolve()
    })
  }

}
