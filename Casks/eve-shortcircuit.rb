cask "eve-shortcircuit" do
  arch arm: "arm64", intel: "x86_64"

  version "2.1.0"
  sha256 arm:   "fd9980fbba147d808ddfc5f604b59bb0f742f12af4d2e10c69129b31e3038662",
         intel: "2807005299339a0c7fb6d99211081eceff32ed5104f5bdad6c7a2ebac0173f91"

  url "https://github.com/mgoodness/shortcircuit/releases/download/v#{version}/shortcircuit-#{arch}.app.tar.gz"
  name "shortcircuit"
  desc "Find shortest path using Tripwire and Eve data"
  homepage "https://github.com/mgoodness/shortcircuit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on :macos

  app "shortcircuit.app"

  zap trash: [
    "~/.config/shortcircuit.ini",
    "~/Library/Logs/shortcircuit",
  ]

  caveats <<~EOS
    #{cask} is not signed or notarized by Apple, so Gatekeeper will block it
    on first launch. Either:
      - Right-click (or Control-click) #{appdir}/shortcircuit.app in Finder,
        choose "Open", then confirm in the dialog, or
      - Remove the quarantine attribute yourself:
          xattr -dr com.apple.quarantine "#{appdir}/shortcircuit.app"
  EOS
end
