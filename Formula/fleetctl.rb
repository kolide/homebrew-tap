class Fleetctl < Formula
  desc "Open Source Osquery Fleet Manager"
  homepage "https://kolide.com/fleet"
  url "https://github.com/kolide/fleet/archive/2.0.0-rc1.tar.gz"
  sha256 "8a1277639cbbd4c973cd8fbffda26ea36d478c04a92696be71473cfc92bb0ffd"

  head "https://github.com/kolide/fleet.git"

  depends_on "go" => :build
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
      system "make", "deps"
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
