class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.3.1.tar.gz"
  sha256 "18db6ceebe155b34eba767d9841599a972fea4c5e8ae95272e9154459c7defdf"

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
