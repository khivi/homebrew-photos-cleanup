# Homebrew cask for Photos Cleanup. Written by the release workflow in
# khivi/photos-cleanup on every release; don't edit it here.
cask "photos-cleanup" do
  version "0.6.0"
  sha256 "33d8535d504dfa8f33c6aaa17ecb4414e88225a28530695fd6749567e8397f30"

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
