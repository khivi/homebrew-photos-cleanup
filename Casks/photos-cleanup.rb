# Homebrew cask for Photos Cleanup. Written by the release workflow in
# khivi/photos-cleanup on every release; don't edit it here.
cask "photos-cleanup" do
  version "0.8.0"
  sha256 "e4a94171dee2ff61a404415cad3c7e10de74fb5e0e9b19a5f9408a5e215985a3"

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
