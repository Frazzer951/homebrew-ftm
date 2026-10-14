# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "a50821fe6ada895c4b598a426f0198c4d9579a733e36605a743caf80d51d35a7",
         intel: "63cf1157451695b0d2d999c05708228ae0caadedf63d0686e33f07f3f2ca3ac1"

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
