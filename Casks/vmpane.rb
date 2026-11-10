cask "vmpane" do
  version "1.0.0-beta.13"
  sha256 "a06bf6dc4df5506a700151939b2eb020788cb37eb181f9b3ac0a4b7752a70e43"

  url "https://github.com/nhtera/vmpane/releases/download/v#{version}/VMPane-#{version}.dmg"
  name "VMPane"
  desc "Virtual machine manager with a CLI and an MCP server for AI agents"
  homepage "https://vmpane.erai.dev"

  livecheck do
    url "https://nhtera.github.io/vmpane/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "VMPane.app"
  binary "#{appdir}/VMPane.app/Contents/Helpers/vmpane"

  # Never ~/Library/Application Support/VMPane: the VMs are the person's data.
  zap trash: [
    "~/Library/Caches/app.vmpane.mac",
    "~/Library/HTTPStorages/app.vmpane.mac",
    "~/Library/Preferences/app.vmpane.mac.plist",
    "~/Library/Saved Application State/app.vmpane.mac.savedState",
  ]
end
