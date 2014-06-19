# ui-hotkey

A Polymer element for specifying hotkeys.

## Usage

    <ui-hotkey key="control+s"></ui-hotkey>

Its single attribute, `key`, specifies the key combination that this
element listens for. When this a `keyup` event matching this key
combination is pressed, this element will emit a `click` event.

Emitting a `click` event makes this a natural element to stick inside
of a button element of some kind (e.g. in a toolbar).
