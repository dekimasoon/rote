import StoreBase from './base.js'
import uuid from 'node-uuid'

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

  constructor(deckId) {
    super({
      deckId,
      cards: [],
      learningCard: {}
    })
  }

  next() {
    return new Promise(resolve => {
      let card
      if (this._state.cards.length && Math.random() < 0.8) {
        let index = Math.floor(Math.random() * this._state.cards.length)
        card = this._state.cards[index]
      } else {
        card = new Card(this._state.deckId, this._state.cards.length + 1)
      }
      this._state.learningCard = card
      this._updated()
      resolve()
    })
  }

  add(question, answer) {
    let card = new Card(this._state.deckId, this._state.cards.length + 1)
    card.question = question
    card.answer = answer
    card.stage = 1
    this._state.cards.push(card)
    this._updated()
  }

  remembered() {
    this._state.learningCard.repeated++
    this._state.learningCard.stage++
  }

  forgotten() {
    this._state.learningCard.repeated++
    this._state.learningCard.stage--
  }

}
