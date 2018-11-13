class Kolide < Formula
  desc "Command-Line Client for Kolide"
  homepage "https://kolide.com/"

  url "https://storage.googleapis.com/kolide-downloads/kolide/0.1.0-138-g718a0d6/darwin/kolide.zip"
  version "0.1.0-138+g718a0d6"
  sha256 "a23b0626006dbd4b066e625d919b314965442be569a296c3a07b4f6828dfbfa6"

  head "https://storage.googleapis.com/kolide-downloads/kolide/latest/darwin/kolide.zip"

  bottle :unneeded

  def install
    bin.install "kolide"
  end

  test do
    system "#{bin}/kolide", "--version"
  end
end
