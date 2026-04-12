class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "3548b23e43655f98b5e5d42ba6e9285c9cd5048cd2bab7e36f6cdb13d870c007"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/man1/me.1"
  end
end
