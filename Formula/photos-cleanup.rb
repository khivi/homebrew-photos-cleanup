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
  sha256 "e319556042b96c0d37c6684d1653824df7c17ae0e934ee2f17c641a45c953cec"
  license "MIT"

  # Package.swift: platforms: [.macOS(.v15)]. AI verdicts additionally need
  # macOS 27 with Apple Intelligence; on older systems the app says so and runs.
  depends_on macos: :sequoia

  def install
    # The binary finds its resource bundles (the UI, and SwiftNIO's) beside
    # itself, so keep them together in libexec.
    libexec.install "photos-cleanup", *Dir["*.bundle"]
    # A wrapper that execs the real libexec path (not a symlink), so
    # Bundle.main resolves to libexec rather than bin.
    bin.write_exec_script libexec/"photos-cleanup"
  end

  def caveats
    <<~EOS
      On first run, macOS asks to let your terminal access your Photos.
      Choose Allow Full Access. To change it later: System Settings >
      Privacy & Security > Photos.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/photos-cleanup --version")
  end
end
