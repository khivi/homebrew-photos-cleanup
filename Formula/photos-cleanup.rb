# Homebrew formula for photos-cleanup.
#
# Install:  brew tap khivi/photos-cleanup && brew install photos-cleanup
# Update:   brew upgrade photos-cleanup
#
# url and sha256 are bumped by the release workflow in khivi/photos-cleanup
# on every release.
class PhotosCleanup < Formula
  desc "Review and clear unwanted photos in the macOS Photos library"
  homepage "https://github.com/khivi/photos-cleanup"
  url "https://github.com/khivi/photos-cleanup/releases/download/v0.3.0/photos-cleanup-0.3.0-macos-universal.tar.gz"
  sha256 "REPLACE_WITH_SHA256_OF_THE_0.3.0_TARBALL"
  license "MIT"

  depends_on :macos
  # Package.swift: platforms: [.macOS(.v15)]. The FoundationModels judge may
  # need newer; see uncertainty 3 in swift-release-draft.md.
  depends_on macos: :sequoia

  def install
    # Keep the binary and the SwiftPM resource bundle side by side: the
    # generated Bundle.module looks for photos-cleanup_PhotosCleanup.bundle
    # next to the executable.
    libexec.install "photos-cleanup", *Dir["*.bundle"]
    # A wrapper that execs the real libexec path (not a symlink), so
    # Bundle.main resolves to libexec rather than bin.
    bin.write_exec_script libexec/"photos-cleanup"
  end

  def caveats
    <<~EOS
      Grant Full Disk Access to your terminal (System Settings > Privacy &
      Security > Full Disk Access) so photos-cleanup can read the Photos library.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/photos-cleanup --version")
  end
end
