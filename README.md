# homebrew-flow

Homebrew tap for **[Flow](https://github.com/devord/flow)** — the desktop shell for flow.devord.com.

## Install

```sh
brew install --cask devord/flow/flow
```

(`brew tap devord/flow` is implicit — Homebrew resolves `devord/flow` to this `devord/homebrew-flow` repo and reads `Casks/flow.rb`.)

Upgrade with `brew upgrade --cask flow`.

## How this tap is maintained

`Casks/flow.rb` is generated, not hand-edited. On every release, the
[`devord/flow` release workflow](https://github.com/devord/flow/blob/main/.github/workflows/release.yml)
builds the universal `.dmg`, attaches it to the GitHub Release on `devord/flow`, then rewrites
`Casks/flow.rb` here with the new version, `sha256`, and download URL. The canonical template lives at
[`packaging/homebrew/flow.rb`](https://github.com/devord/flow/blob/main/packaging/homebrew/flow.rb) in
the app repo — edit it there, not here.

The `Casks/flow.rb` cask appears on the **first** release; until then `brew install` has nothing to
resolve yet.

## Note on signing

Flow is currently distributed **unsigned** (not yet Apple Developer-ID notarized), so first launch may
require clearing the Gatekeeper quarantine — the cask's caveats explain how. This goes away once
notarization is enabled upstream.
