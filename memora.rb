class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/2.0.1.tar.gz"
  sha256 "c32a14f0a4f532fcf2c9aba27bc3667a50ad5b81b4e13de9bd6b92ccb30db7fb"

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
