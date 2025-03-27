# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.22.1"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "01ddd4789bb6669d58b13e847da7dc01cba1a0fa354bf2dd57d2e560434114d6" if OS.mac? && Hardware::CPU.intel?
  sha256 "66343eaebd37437eb92b4b845b18f1f9c201f29eb65be852b66a56b57c693e09" if OS.mac? && Hardware::CPU.arm?
  sha256 "41521f1b921aaf983fa94e1453e85966a786b846bd91c7200859866dfd485c8c" if OS.linux? && Hardware::CPU.intel?
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
