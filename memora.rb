class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.1.2.tar.gz"
  sha256 "44098cb6855909ddd594c44cd6adcd869fcf9ab1eacae934462847fe27698de3"

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
