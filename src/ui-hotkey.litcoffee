# ui-hotkey Overview

Listen for a `keyup` across the entire document. When that `keyup` is heard,
fire a `click` event for this element. Specify keys using vaguely normal human language:

```
<ui-hotkey key="control+g"></ul-hotkey>
```

When the user presses `CTRL+G` this element will fire its `click` event.

Keys are always in the following order, with each key being optional:

  1. control
  2. alt
  3. shift
  4. Lowercase character key (e.g. `g` or `tab`)

If you write `shift+control+/` then the click event will never fire as this
should have been specified as `control+shift+/`.

First, let's include all our predefined key codes.

    keyCodes = require('./key-codes')

Then the magic function that translates a `keyup` event into vaguely human text:

    getAction = (e) ->
      action = [];
      if (e.ctrlKey)
        action.push('control')

      if (e.altKey)
        action.push('alt')

      if (e.shiftKey)
        action.push('shift')

      which = keyCodes[e.which];
      if (action.indexOf(which) == -1)
        action.push(which)

      action.join('+');

Last but not least, the Polymer definition begins:

    Polymer 'ui-hotkey',

##Events

  * **click** This element fires a bog-standard click event when it hears the
    hotkey it is looking for.

# Methods

      myListener: (e) ->
        action = getAction(e)
        if action == @key?.toLowerCase()
          @click()

##Polymer Lifecycle

      attached: ->
        document.addEventListener 'keyup', (e) =>
          @myListener e

      detached: ->
        document.removeEventListener 'keyup', (e) =>
          @myListener e
