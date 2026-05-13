class Me < Formula
  desc "A modern, context-aware replacement for whoami"
  homepage "https://github.com/harveyTon/me"
  url "https://github.com/harveyTon/me/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "65d3646ae4bfb5b850a2e7b5984fdd7b3aa91cbb1f22b80240159266b0e0945d"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.0/me-v0.4.0-macos-arm64.tar.gz"
        sha256 "3ee177e68c7b949f848d3adc8322fcc3c294bd856c7a4e1fd9c0ac88f1686166"
      end
    elsif Hardware::CPU.intel?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.0/me-v0.4.0-macos-x64.tar.gz"
        sha256 "5b8dd0f9d08ad81e3727540ddf362472f5707cdb809fbe86b75861af08a67b6b"
      end
    else
      depends_on "rust" => :build
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.0/me-v0.4.0-linux-arm64.tar.gz"
        sha256 "c272d31337b6e026fa9e393dd5986cef8b989ae16bd4aab16431fcb065631311"
      end
    elsif Hardware::CPU.intel?
      resource "me-binary" do
        url "https://github.com/harveyTon/me/releases/download/v0.4.0/me-v0.4.0-linux-x64.tar.gz"
        sha256 "e5b499c28db6b2c1b012c97c779c00b4263bd9cf2d4a6667d6e28fab2b10fe67"
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
