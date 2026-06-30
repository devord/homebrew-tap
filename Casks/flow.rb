# Homebrew cask for Flow — TEMPLATE.
#
# This is the canonical source for the cask. The release workflow (.github/workflows/release.yml,
# `desktop` job) substitutes 0.2.5 and 02ddaefab3e671c57db911b814a15bbabf98eeb5b8a134eb6556fa939b6a80bd and writes the result to Casks/flow.rb in the
# devord/homebrew-tap on each release. Do not hand-edit the copy in the tap; edit this template.
#
# Install:  brew install --cask devord/tap/flow
#
# UNSIGNED build: Flow is not yet Developer-ID signed or notarized, so the `caveats` below explain the
# one-time Gatekeeper step. When signing lands, delete the caveats block (and nothing else changes).
cask "flow" do
  version "0.2.5"
  sha256 "02ddaefab3e671c57db911b814a15bbabf98eeb5b8a134eb6556fa939b6a80bd"

  # Binaries are hosted on the PUBLIC tap repo's releases, not devord/flow (private) — a private
  # repo's release assets 404 for anonymous `curl`, which is what Homebrew uses. The tap's git tree
  # stays recipe-only; the .dmg rides along as a release asset, attached by the release workflow.
  url "https://github.com/devord/homebrew-tap/releases/download/v#{version}/Flow_#{version}_universal.dmg"
  name "Flow"
  desc "Agentic coding workspace (desktop shell for flow.devord.com)"
  homepage "https://flow.devord.com"

  app "Flow.app"

  caveats <<~EOS
    Flow is not yet notarized. On first launch, macOS Gatekeeper may refuse to open it.
    To allow it, either right-click Flow.app and choose Open, or run:

      xattr -dr com.apple.quarantine "#{appdir}/Flow.app"
  EOS
end
