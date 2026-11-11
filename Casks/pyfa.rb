cask "pyfa" do
  arch arm: "arm64", intel: "x86_64"

  version "2.70.0"
  sha256 arm:   "04579fd5b45517193e64ad3ca684a03e0f2ec6921388e343d7da9119c648d011",
         intel: "10cdb2651fab62d78e9acb178338420173c00691757ce24ee470ecc1d17b5e76"

  url "https://github.com/pyfa-org/Pyfa/releases/download/v#{version}/pyfa-v#{version}-mac-#{arch}.zip"
  name "pyfa"
  desc "Fitting tool for EVE Online"
  homepage "https://github.com/pyfa-org/Pyfa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "pyfa.app"

  zap trash: [
    "~/.pyfa",
    "~/Library/Caches/org.pyfaorg.pyfa",
    "~/Library/Preferences/org.pyfaorg.pyfa.plist",
    "~/Library/Saved Application State/org.pyfaorg.pyfa.savedState",
  ]

  caveats <<~EOS
    #{cask} is not signed or notarized by Apple, so Gatekeeper will block it
    on first launch. Either:
      - Right-click (or Control-click) #{appdir}/pyfa.app in Finder, choose
        "Open", then confirm in the dialog, or
      - Remove the quarantine attribute yourself:
          xattr -dr com.apple.quarantine "#{appdir}/pyfa.app"
  EOS
end
