# mgoodness Tap

## Formulae

| Formula | Description | Upstream |
| --- | --- | --- |
| [kit](Formula/kit.rb) | Lightweight AI agent for coding | [mark3labs/kit](https://github.com/mark3labs/kit) |

## Casks

| Cask | Description | Upstream |
| --- | --- | --- |
| [eve-shortcircuit](Casks/eve-shortcircuit.rb) | Find shortest path using Tripwire and Eve data | [mgoodness/shortcircuit](https://github.com/mgoodness/shortcircuit) |

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
