class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/2.0.0.tar.gz"
  sha256 "aa010869f3c9ed626eaa380d05de9bfcbad3e0f36e04bbd65c95d3f04d8a5341"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/jpalardy/memora").install buildpath.children
    cd "src/github.com/jpalardy/memora" do
      system "go", "build", "-ldflags", "-X main.ASSETS_DIR=#{pkgshare}/assets -X main.VERSION=#{version}", "-o", "bin/memora"
      bin.install "bin/memora"
      pkgshare.install "assets"
    end
  end

  test do
    system "memora", "-version"
  end
end
