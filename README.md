# Early Homebrew Tap

Homebrew tap for [Early](https://github.com/earlybrowser/early-browser), a free, open-source, native macOS browser.

```sh
brew install --cask earlybrowser/tap/early
```

Early needs a Mac with Apple Silicon and macOS 14 or later. It isn't notarized by Apple yet, so the cask removes macOS's quarantine flag from Early.app to let it open; its caveats say so. After that, Early updates itself.

`Casks/early.rb` is written by Early's release workflow when a release is published. Change the template in early-browser's `Packaging/early.rb`, not this file.
