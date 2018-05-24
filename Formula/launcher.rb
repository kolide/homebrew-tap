class Launcher < Formula
  desc "Osquery launcher, autoupdater, and packager"
  homepage "https://kolide.com/launcher"
  url "https://github.com/kolide/launcher/archive/0.5.3.tar.gz"
  sha256 "c14f2bc38e8bd6d1fe38255830c57c6bc1dfe4ef30f6c9d4741b8093ffe3ff6c"

  head "https://github.com/kolide/launcher.git"

  depends_on "go" => :build
  depends_on "go-bindata" => :build
  depends_on "dep" => :build
  depends_on "osquery"

  def install
    contents = Dir["*"]
    gopath = buildpath/"gopath"
    (gopath/"src/github.com/kolide/launcher").install contents

    ENV["GOPATH"] = gopath
    ENV.prepend_create_path "PATH", gopath/"bin"

    cd gopath/"src/github.com/kolide/launcher" do
      system "dep", "ensure", "-vendor-only"
      system "make", "generate"
      system "make", "build"
      bin.install "build/launcher"
      bin.install "build/osquery-extension.ext"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/launcher", "-h"
  end
end
