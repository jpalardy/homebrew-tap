class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.4.1.tar.gz"
  sha256 "87bbe0e4dd554ca9cac03040a710c6a1e17d845631b313f03a28474a3d9f6f91"

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
