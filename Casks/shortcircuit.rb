cask "shortcircuit" do
  arch arm: "arm64", intel: "x86_64"

  version "2.2.0"
  sha256 arm:   "b13ed2bf673f601b3e4c1e73558206a8f98c8667fa59472b52c75d8ab3385572",
         intel: "8e3844a6be79ba9b4129b07ccbe12c9fff0bf14d5355a58ba899da77eae4843f"

  url "https://github.com/mgoodness/shortcircuit/releases/download/v#{version}/shortcircuit-#{arch}.app.tar.gz"
  name "Short Circuit"
  desc "Find shortest path using Tripwire and Eve data"
  homepage "https://github.com/mgoodness/shortcircuit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on :macos

  app "Short Circuit.app"

  zap trash: [
    "~/.config/shortcircuit.ini",
    "~/Library/Logs/shortcircuit",
  ]

  caveats <<~EOS
    #{cask} is not signed or notarized by Apple, so Gatekeeper will block it
    on first launch. Either:
      - Right-click (or Control-click) #{appdir}/Short Circuit.app in Finder,
        choose "Open", then confirm in the dialog, or
      - Remove the quarantine attribute yourself:
          xattr -dr com.apple.quarantine "#{appdir}/Short Circuit.app"
  EOS
end
