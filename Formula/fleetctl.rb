class Fleetctl < Formula
  desc "Open Source Osquery Fleet Manager"
  homepage "https://kolide.com/fleet"
  url "https://github.com/kolide/fleet/archive/2.0.0-rc2.tar.gz"
  sha256 "bc85b2421f9afb72f679790e4a9590384d8f28ec44a68f255d11489eaa72cb3d"

  head "https://github.com/kolide/fleet.git"

  depends_on "go" => :build
  depends_on "dep" => :build
  depends_on "go-bindata" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build

  def install
    contents = Dir["*"]
    gopath = buildpath/"gopath"
    (gopath/"src/github.com/kolide/fleet").install contents

    ENV["GOPATH"] = gopath
    ENV.prepend_create_path "PATH", gopath/"bin"
    ENV.prepend_create_path "PATH", gopath/"src/github.com/kolide/fleet/node_modules/.bin"

    cd gopath/"src/github.com/kolide/fleet" do
      system "yarn"
      system "dep", "ensure", "-vendor-only"
      system "make", "generate"
      system "make", "fleetctl"
      bin.install "build/fleetctl"
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/fleetctl", "--version"
  end
end
