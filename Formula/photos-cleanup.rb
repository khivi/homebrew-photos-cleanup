# Homebrew formula for photos-cleanup.
#
# Install:  brew tap khivi/photos-cleanup && brew install photos-cleanup
# Update:   brew upgrade photos-cleanup
#
# `url` + `sha256` are bumped by the photos-cleanup repo's publish workflow on
# every `v*` tag.
class PhotosCleanup < Formula
  desc "Review and clear unwanted photos in the macOS Photos library"
  homepage "https://github.com/khivi/photos-cleanup"
  url "https://files.pythonhosted.org/packages/e8/2c/4951a91882b5c878e44a2010091996534d927f79240ad57d584c6e346e1f/macos_photos_cleanup-0.2.0.tar.gz"
  sha256 "91b9f736503f95918cf2922c53676ac1c62c28190a2387a53b708f6200499182"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  # Wheels such as tibs ship @rpath dylib IDs with no header room for brew's
  # longer opt-path rewrite; relinking fails the install without this.
  preserve_rpath

  def install
    # ponytail: deps (osxphotos pulls ~100, many pyobjc-framework-*) resolve at
    # install time from PyPI wheels, unpinned. Ceiling: not reproducible and
    # not homebrew-core eligible; switch to `resource` blocks if that matters.
    system "python3.13", "-m", "venv", libexec
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/photos-cleanup"
  end

  def caveats
    <<~EOS
      Grant Full Disk Access to your terminal (System Settings > Privacy &
      Security > Full Disk Access) so photos-cleanup can read the Photos library.

      Optional, for AI verdicts: xcode-select --install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/photos-cleanup --version")
  end
end
