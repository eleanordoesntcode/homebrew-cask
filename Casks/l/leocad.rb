cask "leocad" do
  version "23.03"
  sha256 "7ee537139760b1938980435a3d32bd8068d5e7437e310a01a1f7fd8cf6565867"

  url "https://github.com/leozide/leocad/releases/download/v#{version}/LeoCAD-macOS-#{version}.dmg"
  name "LeoCAD"
  desc "CAD program for creating virtual LEGO models"
  homepage "https://github.com/leozide/leocad"

  no_autobump! because: :requires_manual_review

  depends_on macos: ">= :sierra"

  app "LeoCAD.app"

  zap trash: [
    "~/Library/Caches/LeoCAD Software",
    "~/Library/Preferences/org.leocad.LeoCAD.plist",
    "~/Library/Saved Application State/org.leozide.LeoCAD.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
