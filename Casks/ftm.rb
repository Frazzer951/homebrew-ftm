# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.23"
  sha256 arm:   "c62862c95f17d3a551cc65aa0289256fff80dcd0c7c12fac031036c67232aed7",
         intel: "33f35954bd7fdb58aa2142f68f1be31b490504506e6bbffea3f3b4c2273426aa"

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
