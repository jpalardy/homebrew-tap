class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.0.0.tar.gz"
  sha256 "36fbff5d99d787bbf794ba9890777683256af9d27df413b27f38eae9d04dc10a"

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
