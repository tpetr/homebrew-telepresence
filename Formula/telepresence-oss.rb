# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.20.1"

  BASE_URL = "https://app.getambassador.io/download/tel2oss/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "a8cd0a19ec1640614daac4a97f4048b9abb3be61413e7cca7197d18665d6cb2e" if OS.mac? && Hardware::CPU.intel?
  sha256 "86c048c398a76efac4a402f0bd40ef2dbd83e363c95da525a25ecc7fa7e9efbf" if OS.mac? && Hardware::CPU.arm?
  sha256 "98a50007bcc0a784f7961daaf6ee5cf44aca39c3727fd9b1cb5bc6957e8b8599" if OS.linux? && Hardware::CPU.intel?
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
