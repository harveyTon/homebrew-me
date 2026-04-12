class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "6563dc4874d9d3fc3b3bed6d739e1e6ca903b1c394e9b2d305f890385aa4441b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/man1/me.1"
  end
end
