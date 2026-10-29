# homebrew-photos-cleanup

Homebrew tap for [Photos Cleanup](https://github.com/khivi/photos-cleanup), a Mac app for reviewing and clearing unwanted photos in the macOS Photos library.

Install with `brew install --cask khivi/photos-cleanup/photos-cleanup`. Upgrade with `brew upgrade --cask photos-cleanup`.

The cask installs the signed, notarized app from each GitHub Release. The release workflow in khivi/photos-cleanup writes `Casks/photos-cleanup.rb`; don't edit it here.

Versions up to 0.3.1 were a formula for the `photos-cleanup` command. To move from it, run `brew uninstall photos-cleanup`, then install the cask.
