# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "dcf60086c9f44e964a24e2f002835d7e3d5533ea118e65f176ea9599b8675db0",
         intel: "3a9699557d878a6ef52f266c9ca282d28c41eb82db62ccbc05c0d6727d696aa5"

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
