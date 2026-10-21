cask "vmpane" do
  version "1.0.0-beta.10"
  sha256 "7ee63868ffcf6b2e5d6ed5c712fc38f2c68ef1cbba668f148ec8a18fa52d555a"

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
