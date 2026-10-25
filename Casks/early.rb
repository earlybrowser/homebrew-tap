# Generated from early-browser's Packaging/early.rb when a release is
# published. Edit the template there, not this file.
cask "early" do
  version "0.1.3"
  sha256 "a24992f84b7b8dafd40a37ca82ecd34f4658c2d3d4465248c49a066309caac54"

  url "https://github.com/earlybrowser/early-browser/releases/download/v#{version}/Early-#{version}.zip"
  name "Early"
  desc "Native browser with vertical tabs and a command bar"
  homepage "https://github.com/earlybrowser/early-browser"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Early.app"

  # Early isn't notarized by Apple yet: remove the quarantine flag from
  # Early.app only, so it opens. Its caveats say so.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Early.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/io.github.earlybrowser.Early",
    "~/Library/Containers/io.github.earlybrowser.Early",
  ]

  caveats <<~EOS
    Early isn't notarized by Apple yet, so this cask removed macOS's
    quarantine flag from Early.app to let it open. Early updates itself
    after that.

    If you install Early from the ZIP instead, open it once, then choose
    Open Anyway in System Settings > Privacy & Security, or run:
      xattr -dr com.apple.quarantine /Applications/Early.app
  EOS
end
