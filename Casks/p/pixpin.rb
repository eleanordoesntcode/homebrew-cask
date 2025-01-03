cask "pixpin" do
  version "1.9.5.0"
  sha256 "30e43609473a4894d880c8c0774f43c1d91497df9639c0e72ceef7d9ca275970"

  url "https://download.pixpin.cn/PixPin_#{version}.dmg"
  name "PixPin"
  desc "Screenshot tool"
  homepage "https://pixpin.cn/"

  livecheck do
    url :homepage
    regex(%r{href=.*?/docs/official-log/v?(\d+(?:\.\d+)+)(?:\.html)?["' >]}i)
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "PixPin.app"

  uninstall quit: "com.depthpicture.PixPin"

  zap trash: [
    "~/Library/Application Support/PixPin",
    "~/Library/Caches/com.depthpicture.PixPin",
    "~/Library/Logs/PixPin",
    "~/Library/Preferences/com.depthpicture.PixPin.plist",
    "~/Library/Saved Application State/com.depthpicture.PixPin.savedState",
  ]
end
