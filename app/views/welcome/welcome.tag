<welcome>
  <ul>
    <li each={ decks }>{ name }</li>
  </ul>
  <script type="es6">
    import {Action, Event} from 'stores'

    this.on('mount', () => {
      dispacher.trigger(Action.Deck.Init)
    })

    dispacher.on(Event.Deck.Updated, decks => {
      this.decks = decks
      this.update()
    })
  </script>
</welcome>
