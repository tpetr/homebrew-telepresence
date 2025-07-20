# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.23.5"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "7099b4f6de1146c265a5675d281ae7d8cee9e61eb23ad0a6e5a380ced42337cf" if OS.mac? && Hardware::CPU.intel?
  sha256 "7f884b4803f6094ee3d7bf61462388f7b7f3f3f0422f600af32ff4b52e773025" if OS.mac? && Hardware::CPU.arm?
  sha256 "97609ed7427e0aeabf5cf02ddf1333e13da7aeef1aa1b0fb70ec8ff148e5ac9d" if OS.linux? && Hardware::CPU.intel?
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
