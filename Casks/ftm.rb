# Rendered by .github/workflows/release.yml into Frazzer951/homebrew-ftm as Casks/ftm.rb.
cask "ftm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.14"
  sha256 arm:   "c74fef813cfd226fe633f778e3249fc5c1eb99be33ba00ec173de4cd1958fb0e",
         intel: "1d45143087316d0094272497dcc4ff96c4c9250dd2fd612ae3a70695e2fbf1b3"

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
