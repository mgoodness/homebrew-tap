cask "pyfa" do
  arch arm: "arm64", intel: "x86_64"

  version "2.69.3"
  sha256 arm:   "bccf3ef17c1d453bc5e5e7a785f2ca093c21b40512684c2634d5437782a4b853",
         intel: "d2c65ea5dc43337b971d51ddf7497b9f07fa2b2d340e76734007d84bffb7c1dc"

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
