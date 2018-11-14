class Kolide < Formula
  desc "Command-Line Client for Kolide"
  homepage "https://kolide.com/"

  url "https://storage.googleapis.com/kolide-downloads/kolide/0.2.0-13-g94916d5/darwin/kolide.zip"
  version "0.2.0-13+g94916d5"
  sha256 "d8e1235baa63b25e949b6143ed7a115bdb0403bc7284e6844bf9cc8b11fc4af5"

  head "https://storage.googleapis.com/kolide-downloads/kolide/latest/darwin/kolide.zip"

  bottle :unneeded

  def install
    bin.install "kolide"
  end

  test do
    system "#{bin}/kolide", "--version"
  end
end
