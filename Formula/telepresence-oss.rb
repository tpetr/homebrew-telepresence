# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.23.0"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "f82930aece6251a78ade8593c8b051eef59d55f9df831588d9a19db0aaa2cb7d" if OS.mac? && Hardware::CPU.intel?
  sha256 "07a192a9d4e1bb9c9a76344edb6f02a02f7edb2ecd2ac31061e282bf823f8cd5" if OS.mac? && Hardware::CPU.arm?
  sha256 "b3f4a9e34b250903232f849b3fbc898f1585e912184fcb7409a47dfac40cdb3a" if OS.linux? && Hardware::CPU.intel?
  # TODO support linux arm64
  #sha256 "__TARBALL_HASH_LINUX_ARM64__" if OS.linux? && Hardware::CPU.arm?

  conflicts_with "telepresence"

  def install
      bin.install "#{PACKAGE_NAME}" => "telepresence"
  end

  test do
      system "#{bin}/telepresence", "--help"
  end
end
