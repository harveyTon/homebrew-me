class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "1e1226199ad630b67574238f225b078ca5ab821769e8482ff1ee3382cc89b591"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/man1/me.1"
  end
end
