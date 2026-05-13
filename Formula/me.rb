class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "f3be562a82117d2d95ef4d82436659597ae70b6634622ae54b69084cc643cedb"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.1/me-v0.4.1-macos-arm64.tar.gz"
        sha256 "f15030fa10b614e22cd209f56756cd0d18b55ff9e40680cc1704748fb904e12e"
      end
    elsif Hardware::CPU.intel?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.1/me-v0.4.1-macos-x64.tar.gz"
        sha256 "f72b4f703e3a2e00e8414d50b2a1805483632748c6303b7b5c5eec638f7661e7"
      end
    else
      depends_on "rust" => :build
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.1/me-v0.4.1-linux-arm64.tar.gz"
        sha256 "f4e8851da29990710ba1b6f5370ccc63100e427b6d6afe3972966e03ce735765"
      end
    elsif Hardware::CPU.intel?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.1/me-v0.4.1-linux-x64.tar.gz"
        sha256 "a2345fa32af7b8b03021338443c156ef0fb078a50aafc0209107ce22b2f142f5"
      end
    else
      depends_on "rust" => :build
    end
  else
    depends_on "rust" => :build
  end

  def install
    if prebuilt_binary_available?
      resource("me-binary").stage do
        bin.install "me"
      end
    else
      system "cargo", "install", *std_cargo_args
    end

    man1.install "man/man1/me.1"
  end

  private

  def prebuilt_binary_available?
    (OS.mac? || OS.linux?) && (Hardware::CPU.arm? || Hardware::CPU.intel?)
  end
end
