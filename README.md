# mgoodness Tap

## Formulae

| Formula | Description | Upstream |
| --- | --- | --- |
| [kit](Formula/kit.rb) | Lightweight AI agent for coding | [mark3labs/kit](https://github.com/mark3labs/kit) |

## Casks

| Cask | Description | Upstream |
| --- | --- | --- |
| [pyfa](Casks/pyfa.rb) | Fitting tool for EVE Online | [pyfa-org/Pyfa](https://github.com/pyfa-org/Pyfa) |
| [shortcircuit](Casks/shortcircuit.rb) | Find shortest path using Tripwire and Eve data | [mgoodness/shortcircuit](https://github.com/mgoodness/shortcircuit) |
| [theorycrafter](Casks/theorycrafter.rb) | Fitting tool for EVE Online with doctrines and a fit optimizer | [Theorycrafter](https://theorycrafter.pro/) |

`pyfa` shadows a disabled cask of the same name in `homebrew-cask`, so install
it fully qualified: `brew install --cask mgoodness/tap/pyfa`.

None of these casks are signed or notarized by Apple, so Gatekeeper needs
a one-time approval on first launch — see each cask's caveats.

## How do I install these formulae?

`brew install mgoodness/tap/<formula>`

Or `brew tap mgoodness/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "mgoodness/tap"
brew "<formula>"
```

Casks work the same way with `brew install --cask mgoodness/tap/<cask>` or
`cask "<cask>"` in a `Brewfile`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
