import StoreBase from './base.js'

export class Deck {
  constructor(name) {
    this.id = 0
    this.name = name
    this.created = new Date()
    this.updated = new Date()
    this.cards = []
    this.achievement = 0.0
  }
}

export class DeckStore extends StoreBase {

  constructor() {
    super({
      decks: [],
      learningDeck: {}
    })
    if (!this._state.decks.length) {
      let deck = new Deck('Duo3.0 全文')
      this._state.decks.push(deck)
      this._state.learningDeck = deck
    }
    this._triggerUpdated()
  }

  add(deck) {
    this._state.decks.push(deck)
    this._state.learningDeck = deck
    this._trrigerUpdated()
  }

  select(id) {
    this._state.learningDeck = this._state.decks.find(deck => {
      return deck.id === id
    })
    this._triggerUpdated()
  }
}
