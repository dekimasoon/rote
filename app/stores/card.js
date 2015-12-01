import uuid from 'node-uuid'
import StoreBase from './base.js'

export class Card {
  constructor(deckId, number) {
    this.id = uuid.v4()
    this.deckId = deckId
    this.number = number
    this.created = new Date()
    this.updated = new Date()
    this.repeated = 0
    this.stage = 0
    this.question = ''
    this.answer = ''
  }
}

export class CardStore extends StoreBase {

  constructor(deck) {
    super({
      deck,
      cards: [],
      learningCard: {}
    })
  }

  next() {
    return new Promise(resolve => {
      let card
      let index = Math.floor(Math.random() * this._state.cards.length)
      if (this._state.deck.pause) {
        if (this._state.cards.length) {
          card = this._state.cards[index]
        } else {
          card = new Card(this._state.deck.id, this._state.cards.length + 1)
          throw new Error('unexpectable')
        }
      } else if (this._state.cards.length && Math.random() < 0.8) {
        card = this._state.cards[index]
      } else {
        card = new Card(this._state.deck.id, this._state.cards.length + 1)
      }
      this._state.learningCard = card
      this._updated()
      resolve()
    })
  }

  add(question, answer) {
    return new Promise(resolve => {
      let card = new Card(this._state.deck.id, this._state.cards.length + 1)
      card.question = question
      card.answer = answer
      card.stage = 1
      this._state.cards.push(card)
      resolve()
    })
  }

  remembered() {
    return new Promise(resolve => {
      let card = this._state.learningCard
      card.repeated++
      card.stage = Math.min(card.stage + 1, 5)
      resolve()
    })
  }

  forgotten() {
    return new Promise(resolve => {
      let card = this._state.learningCard
      card.repeated++
      card.stage = Math.max(card.stage - 1, 0)
      resolve()
    })
  }

}
