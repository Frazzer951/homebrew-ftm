# Rendered by .github/workflows/nightly.yml into Frazzer951/homebrew-ftm as Casks/ftm@nightly.rb.
cask "ftm@nightly" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.7-nightly.20261015.24"
  sha256 arm:   "fbfc27641afb8c797f28212e6c844a886db998a7273f636031a4f1b961bdfb9b",
         intel: "413b80f3493d267547fde9a1b191dd13044804faaa807a8cbb8d98ce21c455e0"

  url "https://github.com/Frazzer951/ftm/releases/download/v#{version}/FTM.Nightly_#{version}_#{arch}.dmg"
  name "FTM Nightly"
  desc "Terminal workspace manager for Claude Code agents (nightly build)"
  homepage "https://github.com/Frazzer951/ftm"

  depends_on :macos

  # Runs its own daemon, so it installs next to the ftm cask; the CLI is linked as ftm-nightly.
  app "FTM Nightly.app"
  binary "#{appdir}/FTM Nightly.app/Contents/MacOS/ftm", target: "ftm-nightly"

  # Signed ad hoc, not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/FTM Nightly.app"]
  end

  zap trash: [
    "~/Library/Caches/dev.frazzer.ftm.nightly",
    "~/Library/Caches/ftm-nightly",
    "~/Library/WebKit/dev.frazzer.ftm.nightly",
  ]
end
