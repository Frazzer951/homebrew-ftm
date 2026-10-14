# Rendered by .github/workflows/nightly.yml into Frazzer951/homebrew-ftm as Casks/ftm@nightly.rb.
cask "ftm@nightly" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2-nightly.20261014.2"
  sha256 arm:   "2b928387ae6f97334fc2b1a296e076c5557027bd7e59bbbecb6144e9dfce00ae",
         intel: "f6795c1f013faca2eec5c5f560988938352a0eaee33da2f02ccca2f3e73ea0b6"

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
