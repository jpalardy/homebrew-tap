class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/2.6.0.tar.gz"
  sha256 "cfb8f98aa5d473901642e5a22fde39811cfd9987eb671138b88522ed008164e7"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/jpalardy/memora/cmd.VERSION=#{version}", "-o", "bin/memora"
    bin.install "bin/memora"
  end

  test do
    system "memora", "--version"
  end
end
