# Rendered by .github/workflows/nightly.yml into Frazzer951/homebrew-ftm as Casks/ftm@nightly.rb.
cask "ftm@nightly" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.25-nightly.20261124.70"
  sha256 arm:   "42e6ea851bce8e334af8c353337be287bef3eadf0f97979398a81e050b692b20",
         intel: "9673fd7defab9128e360c17e8c02cd69a83c030659ec5ec392a7eb0493da8251"

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
