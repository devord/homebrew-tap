# Homebrew cask for Flow — TEMPLATE.
#
# This is the canonical source for the cask. The release workflow (.github/workflows/release.yml,
# `desktop` job) substitutes 0.9.5 and 457680a78a24568fd061b01d0f5ad67e6abd591ae263f75c81b6f1460830c536 and writes the result to Casks/flow.rb in the
# devord/homebrew-tap on each release. Do not hand-edit the copy in the tap; edit this template.
#
# Install:  brew install --cask devord/tap/flow
#
# UNSIGNED build: Flow is not yet Developer-ID signed or notarized, so the `caveats` below explain the
# one-time Gatekeeper step. When signing lands, delete the caveats block (and nothing else changes).
cask "flow" do
  version "0.9.5"
  sha256 "457680a78a24568fd061b01d0f5ad67e6abd591ae263f75c81b6f1460830c536"

  # Binaries are hosted on the PUBLIC tap repo's releases, not devord/flow (private) — a private
  # repo's release assets 404 for anonymous `curl`, which is what Homebrew uses. The tap's git tree
  # stays recipe-only; the .dmg rides along as a release asset, attached by the release workflow.
  url "https://github.com/devord/homebrew-tap/releases/download/v#{version}/Flow_#{version}_universal.dmg"
  name "Flow"
  desc "Agentic coding workspace (desktop shell for flow.devord.com)"
  homepage "https://flow.devord.com"

  app "Flow.app"

  # Flow updates itself in place via Tauri's updater (Settings › Updates / the update prompt), so the
  # version Homebrew recorded goes stale after a self-update. `auto_updates true` tells `brew upgrade`
  # the app manages its own updates, so it won't try to reinstall over a newer self-updated build.
  auto_updates true

  caveats <<~EOS
    Flow is not yet notarized. On first launch, macOS Gatekeeper may refuse to open it.
    To allow it, either right-click Flow.app and choose Open, or run:

      xattr -dr com.apple.quarantine "#{appdir}/Flow.app"
  EOS
end
