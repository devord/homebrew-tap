# Homebrew cask for Flow — TEMPLATE.
#
# This is the canonical source for the cask. The release workflow (.github/workflows/release.yml,
# `desktop` job) substitutes 0.1.0 and ca351e8071ac2ecfca64baaded08182aa22265aa341119146628f3f638c9a222 and writes the result to Casks/flow.rb in the
# devord/homebrew-tap on each release. Do not hand-edit the copy in the tap; edit this template.
#
# Install:  brew install --cask devord/tap/flow
#
# UNSIGNED build: Flow is not yet Developer-ID signed or notarized, so the `caveats` below explain the
# one-time Gatekeeper step. When signing lands, delete the caveats block (and nothing else changes).
cask "flow" do
  version "0.1.0"
  sha256 "ca351e8071ac2ecfca64baaded08182aa22265aa341119146628f3f638c9a222"

  url "https://github.com/devord/flow/releases/download/v#{version}/Flow_#{version}_universal.dmg"
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
