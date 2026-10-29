# Homebrew cask for Photos Cleanup. Written by the release workflow in
# khivi/photos-cleanup on every release; don't edit it here.
cask "photos-cleanup" do
  version "0.5.0"
  sha256 "5fa52f935c8e24f02bdf8ef7f853ec30fe09da7123695075ac9be962f1f78dbf"

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
