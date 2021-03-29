class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/2.3.2.tar.gz"
  sha256 "f184e0487e362b98a72263e373d1177a6355fb9d25900947515cfa5ae9929ec7"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/jpalardy/memora/cmd.VERSION=#{version}", "-o", "bin/memora"
    bin.install "bin/memora"
  end

  test do
    system "memora", "--version"
  end
end
