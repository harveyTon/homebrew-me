class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "65d3646ae4bfb5b850a2e7b5984fdd7b3aa91cbb1f22b80240159266b0e0945d"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/man1/me.1"
  end
end
