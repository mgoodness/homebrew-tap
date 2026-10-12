cask "shortcircuit" do
  version "2.2.1"
  sha256 "bb012c71ca5e2bb5748e54ccd875c0452d5703cb27177af8f975b9ca87de965f"

  url "https://github.com/mgoodness/shortcircuit/releases/download/v#{version}/shortcircuit-universal2.app.tar.gz"
  name "Short Circuit"
  desc "Find shortest path using Tripwire and Eve data"
  homepage "https://github.com/mgoodness/shortcircuit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :monterey

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
