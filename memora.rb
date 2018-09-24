class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.1.0.tar.gz"
  sha256 "bde2dddefd717149d40f69b4c29aaa424ee7c5275f89ba560b111028f53c843e"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "-ldflags", "-X main.ASSETS_DIR=#{pkgshare}/assets -X main.VERSION=#{version}", "-o", "memora", "github.com/jpalardy/memora"
    bin.install "memora"
    pkgshare.install "assets"
  end

  test do
    system "memora", "-h"
  end
end
