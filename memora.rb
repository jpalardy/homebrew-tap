class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/1.4.0.tar.gz"
  sha256 "9138e5af90ec9004932308cb29031b51a396238b3eec82d7affdf653ec8035f4"

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
