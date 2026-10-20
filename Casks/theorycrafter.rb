cask "theorycrafter" do
  version "1.9.14"
  sha256 "db5887b7f47ea6e4576f2f083d195778815dfc46359e3bceb92bc18e892352f1"

  url "https://theorycrafter.pro/releases/#{version}/Theorycrafter-#{version}-macos-aarch64.dmg"
  name "Theorycrafter"
  desc "Fitting tool for EVE Online with doctrines and a fit optimizer"
  homepage "https://theorycrafter.pro/"

  livecheck do
    url "https://theorycrafter.pro/"
    regex(%r{releases/(\d+(?:\.\d+)+)/Theorycrafter-\d+(?:\.\d+)+-macosx?-aarch64\.dmg}i)
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Theorycrafter.app"

  zap trash: [
    "~/Library/Application Support/Theorycrafter",
    "~/Library/Preferences/theorycrafter.plist",
  ]

  caveats <<~EOS
    #{cask} is not signed or notarized by Apple, so Gatekeeper will block it
    on first launch. Either:
      - Right-click (or Control-click) #{appdir}/Theorycrafter.app in Finder,
        choose "Open", then confirm in the dialog, or
      - Remove the quarantine attribute yourself:
          xattr -dr com.apple.quarantine "#{appdir}/Theorycrafter.app"
  EOS
end
