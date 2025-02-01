# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.21.2"

  BASE_URL = "https://app.getambassador.io/download/tel2oss/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "ff819b40996aba2680f499eaf7ae030b47eacd35052485ff66b544507f22ea7c" if OS.mac? && Hardware::CPU.intel?
  sha256 "c871abf316cb70b5c8c526f12418eb7a13b1e497f4f5c9cdc9baa05790bfcec4" if OS.mac? && Hardware::CPU.arm?
  sha256 "4c84765b90f369766ab25ac63bcb85f890c11814a189842b0368d3a6f08e120f" if OS.linux? && Hardware::CPU.intel?
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
