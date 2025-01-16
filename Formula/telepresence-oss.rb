# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.21.1"

  BASE_URL = "https://app.getambassador.io/download/tel2oss/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "ca10c776ff17a1071e5853265d022d52e11b9acd3188bce5b4a647389331d38f" if OS.mac? && Hardware::CPU.intel?
  sha256 "7b3b0024fcba13c953e21008763c905cda5957885f8f39ace59e15fb76519333" if OS.mac? && Hardware::CPU.arm?
  sha256 "563ff3089e1b180979be14da335625e6c77814d9087578127d3ead1728b3e18a" if OS.linux? && Hardware::CPU.intel?
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
