class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/2.2.0.tar.gz"
  sha256 "8a30435d14c7e35e83267ed206fb0df5dc65bda28cfd154bf4bfd092b1d4a829"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/jpalardy/memora/cmd.VERSION=#{version}", "-o", "bin/memora"
    bin.install "bin/memora"
  end

  test do
    system "memora", "--version"
  end
end
