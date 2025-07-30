class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/3.2.0.tar.gz"
  sha256 "a85b76f30b3f56b41302e8620abd9273a95e996870d558f7296b12ab5a1e30cd"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/jpalardy/memora/cmd.VERSION=#{version}", "-o", "bin/memora"
    bin.install "bin/memora"
  end

  test do
    system "memora", "--version"
  end
end
