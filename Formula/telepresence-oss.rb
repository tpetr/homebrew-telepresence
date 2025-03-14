# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.22.0"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "2b3134667d81c012efedab46489d5d04791a5ebb7c9e0c3554a9e3a8a4783e96" if OS.mac? && Hardware::CPU.intel?
  sha256 "b0090e00bfe99c5423ec0f52d165311495d3459904bf5db59bf2d47ad902c8d2" if OS.mac? && Hardware::CPU.arm?
  sha256 "0661584e574c89cf0c82f469ada3f6d36ed99285afb8b3408f9f5f2a17f1fd52" if OS.linux? && Hardware::CPU.intel?
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
