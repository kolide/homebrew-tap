class Kolide < Formula
  desc "Command-Line Client for Kolide"
  homepage "https://kolide.com/"

  url "https://storage.googleapis.com/kolide-downloads/kolide/0.1.0-28-g75aff00/darwin/kolide.zip"
  version "0.1.0-28+g75aff00"
  sha256 "70b784d844d25fbac814fa1b7f41deda38d541daf4a35e43646a44dbd9182126"

  head "https://storage.googleapis.com/kolide-downloads/kolide/latest/darwin/kolide.zip"

  bottle :unneeded

  def install
    bin.install "kolide"
  end

  test do
    system "#{bin}/kolide", "--version"
  end
end
