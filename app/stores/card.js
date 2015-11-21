import StoreBase from './base.js'

export class Card {
  constructor(deck) {
    this.id = 0
    this.number = deck.cards.length + 1
    this.deck = deck
    this.created = new Date()
    this.updated = new Date()
    this.repeated = 0
    this.stage = 0
    this.question = ''
    this.answer = ''
  }
}

export class CardStore extends StoreBase {

  constructor(deckStore) {
    super({
      deck: {},
      cards: [],
      learningCard: {}
    })
    this._addDependency(deckStore, state => {
      this._state.deck = state.learningDeck
    })
  }

  next() {
    let card = new Card(this._state.deck)
    if (Math.random() < 0.5) {
      card.id = 3179281319
      card.question = '個人の意志は尊重しなければならない'
      card.answer = 'We must respect the will of the individual.'
    }
    this._state.learningCard = card
    this._triggerUpdated()
  }
}
