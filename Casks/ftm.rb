# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "40f6db84862e8bfa22a7b996e0c43a3b4fa5b9ba0aa357691b0e30d256dbb5d6",
         intel: "b77dd7832684b43a5fb5b8ec2d1022cae4dc454ed918e578514fd91504f467c3"

  url "https://github.com/Frazzer951/ftm/releases/download/v#{version}/FTM_#{version}_#{arch}.dmg"
  name "FTM"
  desc "Terminal workspace manager for Claude Code agents"
  homepage "https://github.com/Frazzer951/ftm"

  app "FTM.app"
  binary "#{appdir}/FTM.app/Contents/MacOS/ftm"

  # Signed ad hoc, not notarized: without this Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FTM.app"]
  end

  zap trash: [
    "~/Library/Caches/ftm",
    "~/Library/Caches/dev.frazzer.ftm",
    "~/Library/WebKit/dev.frazzer.ftm",
  ]
end
