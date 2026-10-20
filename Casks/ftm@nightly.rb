# Rendered by .github/workflows/nightly.yml into Frazzer951/homebrew-ftm as Casks/ftm@nightly.rb.
cask "ftm@nightly" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.15-nightly.20261020.47"
  sha256 arm:   "543f9dc77f7c5fb08bc50f847838d96e433037bfb536040879924419cf6ed81e",
         intel: "67a2d435d358b3288c078e8fc80f2a6e91aa33849db3542c03cd9fddef7cf9ad"

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
