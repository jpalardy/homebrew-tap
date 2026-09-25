class Memora < Formula
  desc "Another spaced repetition flashcard app"
  homepage "https://github.com/jpalardy/memora"
  url "https://github.com/jpalardy/memora/archive/refs/tags/3.5.1.tar.gz"
  sha256 "38e7d953cf8296550c16fd86d68e183b62f26191484acdd30aba9c6a224baa5c"
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
