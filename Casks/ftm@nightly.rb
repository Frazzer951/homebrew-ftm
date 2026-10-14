# Rendered by .github/workflows/nightly.yml into Frazzer951/homebrew-ftm as Casks/ftm@nightly.rb.
cask "ftm@nightly" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2-nightly.20261014.3"
  sha256 arm:   "6bad571a212895b03b2883784b021b84436549d1f54dacce7c4f1f337874c9a2",
         intel: "96ba9d6403bfc414bf071c90d98c2c83c4b7382e75046cffc7364d933fbe938d"

  url "https://github.com/Frazzer951/ftm/releases/download/v#{version}/FTM.Nightly_#{version}_#{arch}.dmg"
  name "FTM Nightly"
  desc "Terminal workspace manager for Claude Code agents (nightly build)"
  homepage "https://github.com/Frazzer951/ftm"

  # Runs its own daemon, so it installs next to the ftm cask; the CLI is linked as ftm-nightly.
  app "FTM Nightly.app"
  binary "#{appdir}/FTM Nightly.app/Contents/MacOS/ftm", target: "ftm-nightly"

  # Signed ad hoc, not notarized: without this Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FTM Nightly.app"]
  end

  zap trash: [
    "~/Library/Caches/ftm-nightly",
    "~/Library/Caches/dev.frazzer.ftm.nightly",
    "~/Library/WebKit/dev.frazzer.ftm.nightly",
  ]
end
