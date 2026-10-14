# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "f79657f0108c4c49713ac162825f716b4dec6782e7e86ddd3b092bc508803470",
         intel: "343dc3c4be879b99be1547820cb7713c21f690fc0f4017e32358028c4aacaaac"

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
