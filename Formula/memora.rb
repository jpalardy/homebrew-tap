class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/refs/tags/3.5.0.tar.gz"
  sha256 "2316c7f773d4cdef49d2ef8c3d686b4eea3a15d27963e87be1f90a5946eff995"
  license "MIT"

  depends_on "elm" => :build
  depends_on "go" => :build

  def install
    cd "web" do
      system "elm", "make", "src/Main.elm", "--optimize", "--output", "public/js/app.js"
    end

    ldflags = "-X github.com/jpalardy/memora/cmd.VERSION=#{version}"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memora --version")
  end
end
