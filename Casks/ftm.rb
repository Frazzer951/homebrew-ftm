# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "8809a07da05573675bd2014be13b4992f4836b24db7eabf637e0f7f3bb999865",
         intel: "cb794950d1e026a2f9c8657aafb98ee6b72689993ae8baddfa8d3e9c3a90185d"

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
