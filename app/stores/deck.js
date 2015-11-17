export const DeckAction = {
  Init: 'DeckInit',
  Add: 'DeckAdd',
  Select: 'DeckSelect',
  GetCard: 'DeckGetCard'
}

export const DeckEvent = {
  Updated: 'DeckUpdated',
  CardUpdated: 'DeckCardUpdated'
}

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

export class DeckStore {
  constructor() {
    riot.observable(this)
    this.decks = []
    this.selectedDeck = null
    this.selectedCard = null
    // Initialize
    this.on(DeckAction.Init, () => {
      // for dev
      if (!this.decks.length) {
        let deck = new Deck('Duo3.0 全文')
        this.decks.push(deck)
        this.selectedDeck = deck
      }
      this.trigger(DeckEvent.Updated, this.decks)
    })
    // Add new deck
    this.on(DeckAction.Add, deck => {
      this.decks.push(deck)
      this.trigger(DeckEvent.Updated, this.decks)
    })
    // Select deck
    this.on(DeckAction.Select, id => {
      this.decks.forEach(deck => {
        if (id === deck.id) {
          this.selectedDeck = deck
        }
      })
    })
    // Get card
    this.on(DeckAction.GetCard, () => {
      let card = new Card(this.selectedDeck)
      if (Math.random() < 0.5) {
        card.id = 3179281319
        card.question = '個人の意志は尊重しなければならない'
        card.answer = 'We must respect the will of the individual.'
      }
      this.selectedCard = card
      this.trigger(DeckEvent.CardUpdated, this.selectedCard)
    })
  }
}
