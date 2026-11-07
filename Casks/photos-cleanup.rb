# Homebrew cask for Photos Cleanup. Written by the release workflow in
# khivi/photos-cleanup on every release; don't edit it here.
cask "photos-cleanup" do
  version "0.9.0"
  sha256 "7d6520a1e4afc45d0657834bfe2d30047ecc6cca6e787b818419e49e2d2f105a"

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
