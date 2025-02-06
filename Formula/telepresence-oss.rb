# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.21.3"

  BASE_URL = "https://app.getambassador.io/download/tel2oss/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "f3cbe3883adb46f3856766f0f0e5630c3b55d9372a873f9153e45b1445e44f26" if OS.mac? && Hardware::CPU.intel?
  sha256 "e32e9af52b929b608ee65dd55f981c019404c52a481c56b49ab2c06b4b8fe7f8" if OS.mac? && Hardware::CPU.arm?
  sha256 "27e2e12d8f3a8d4ceaa5d42d811f27ae6fda226d3ff0e387daae2be74e6d6c37" if OS.linux? && Hardware::CPU.intel?
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
