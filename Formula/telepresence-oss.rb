# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.23.3"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "aaae3db2de30c8934630a5ce6fed10412e2ca3e2d374665bde57f50a069e931a" if OS.mac? && Hardware::CPU.intel?
  sha256 "d26c34c2d19c2fd160120d035298f5807da44a5dad28674453f3f64b1b7781c1" if OS.mac? && Hardware::CPU.arm?
  sha256 "199357b71e38741b4a8cc8c4ec29dec4ae1c1c68a3b966e5c9abd09e23a9b546" if OS.linux? && Hardware::CPU.intel?
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
