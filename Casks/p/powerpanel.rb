cask "powerpanel" do
  version "2.6.1"
  sha256 "2208c48df9b1c893a66de7b1652e1ff30ca1728948860db9fcf919c7d066fed4"

  url "https://dl4jz3rbrsfum.cloudfront.net/software/PPP_Mac_v#{version}.pkg",
      verified: "dl4jz3rbrsfum.cloudfront.net/"
  name "CyberPower PowerPanel Personal"
  desc "Manage and control UPS systems"
  homepage "https://www.cyberpowersystems.com/products/software/power-panel-personal/"

  livecheck do
    url "https://www.cyberpowersystems.com/product/software/power-panel-personal/powerpanel-personal-mac/"
    regex(/href=.*?PPP[._-]Mac[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
  end

  no_autobump! because: :requires_manual_review

  depends_on macos: ">= :mojave"

  pkg "PPP_Mac_v#{version}.pkg"

  uninstall launchctl: [
              "com.cpsww.ppupsd",
              "com.cyberpower.powerpanel-personal.client",
              "com.cyberpower.powerpanel-personal.daemon",
            ],
            pkgutil:   [
              "com.cpsww.ppupsd",
              "com.cyberpower.powerpanelpersonal.ppp",
            ],
            delete:    "/Applications/PowerPanel Personal.app"

  zap delete: [
        "/Library/LaunchAgents/com.cyberpower.powerpanel-personal.client.plist",
        "/Library/LaunchDaemons/com.cyberpower.powerpanel-personal.daemon.plist",
      ],
      trash:  [
        "~/Library/Preferences/PowerPanel Personal.plist",
        "~/Library/Saved Application State/PowerPanel Personal.savedState",
      ]
end
