# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.13"
  sha256 arm:   "512bc2674e3150e2e3e37a5bc332d5e4185c1dec8814b5ab8768749ccc5c8b44",
         intel: "646f16b12897ad7bb0644c98cd9ef40e74b5fefa3a9b2b0efcfa1052fd7cf8aa"

  url "https://github.com/Frazzer951/ftm/releases/download/v#{version}/FTM_#{version}_#{arch}.dmg"
  name "FTM"
  desc "Terminal workspace manager for Claude Code agents"
  homepage "https://github.com/Frazzer951/ftm"

  depends_on :macos

  app "FTM.app"
  binary "#{appdir}/FTM.app/Contents/MacOS/ftm"

  # Signed ad hoc, not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/FTM.app"]
  end

  zap trash: [
    "~/Library/Caches/dev.frazzer.ftm",
    "~/Library/Caches/ftm",
    "~/Library/WebKit/dev.frazzer.ftm",
  ]
end
