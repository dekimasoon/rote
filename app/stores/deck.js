export const DeckAction = {
  Init: 'DeckInit',
  Add: 'DeckAdd'
}

export const DeckEvent = {
  Updated: 'DeckUpdated'
}

export class Deck {
  constructor(name) {
    this.id = 0
    this.name = name
    this.created = new Date()
    this.sentences = []
    this.achievement = 0.0
  }
}

export class DeckStore {
  constructor() {
    riot.observable(this)
    this.decks = []
    // Initialize
    this.on(DeckAction.Init, () => {
      // for dev
      if (!this.decks.length) {
        let deck = new Deck('Duo3.0 全文')
        this.decks.push(deck)
      }
      this.trigger(DeckEvent.Updated, this.decks)
    })
    // Add New Deck
    this.on(DeckAction.Add, deck => {
      this.decks.push(deck)
      this.trigger(DeckEvent.Updated, this.decks)
    })
  }
}
