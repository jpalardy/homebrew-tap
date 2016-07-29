class MemoraExperiment < Formula
  desc "memora, just an experiment, for now"
  homepage "https://github.com/jpalardy/memora-experiment"
  url "https://github.com/jpalardy/memora-experiment/archive/0.2.0.tar.gz"
  sha256 "99b5d90e2d676b4477ffcd3fce3fc9783a993746a16421893f53478e50ec24e9"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "-ldflags", "-X main.ASSETS_DIR=#{pkgshare}/assets", "-o", "memora", "github.com/jpalardy/memora"
    bin.install "memora"
    pkgshare.install "assets"
  end

  test do
    system "memora", "-h"
  end
end
