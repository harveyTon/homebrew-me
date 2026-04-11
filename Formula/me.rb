class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "e2cacfc9e0ee1d55ac4e53b95aad5552a215c620aa2f5d14d2b58bb937c8314c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/man1/me.1"
  end
end
