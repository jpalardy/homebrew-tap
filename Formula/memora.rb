class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/3.5.0.tar.gz"
  sha256 "2316c7f773d4cdef49d2ef8c3d686b4eea3a15d27963e87be1f90a5946eff995"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/jpalardy/memora/cmd.VERSION=#{version}", "-o", "bin/memora"
    bin.install "bin/memora"
  end

  test do
    system "memora", "--version"
  end
end
