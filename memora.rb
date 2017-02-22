class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.0.3.tar.gz"
  sha256 "f59e0000bffe681b8a7f6a7c22dad402ad7fcd64a6e5295173e4fb8fa0a64588"

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
