# Homebrew cask for Photos Cleanup. Written by the release workflow in
# khivi/photos-cleanup on every release; don't edit it here.
cask "photos-cleanup" do
  version "0.11.0"
  sha256 "ac6dc0f8b6911799cbd3e9fda642657965624071c06b958ad42b9c5ac6637cfc"

  url "https://github.com/khivi/photos-cleanup/releases/download/v#{version}/Photos-Cleanup-#{version}.zip"
  name "Photos Cleanup"
  desc "Review and clear unwanted photos in the Photos library"
  homepage "https://github.com/khivi/photos-cleanup"

  depends_on macos: :sequoia

  app "Photos Cleanup.app"

  zap trash: [
    "~/Library/Application Support/photos-cleanup",
    "~/Library/Caches/photos-cleanup",
  ]
end
