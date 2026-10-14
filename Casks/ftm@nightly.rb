# Rendered by .github/workflows/nightly.yml into Frazzer951/homebrew-ftm as Casks/ftm@nightly.rb.
cask "ftm@nightly" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.3-nightly.20261014.9"
  sha256 arm:   "efc1d4a91535fa6c5d4026ffd445fc147bb38bf9c3f0f3314059f79107899d18",
         intel: "cc8837f00a5113914526ebd6b45122dc1be7a6fdafc6ac4e189ce9383e0d481b"

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
