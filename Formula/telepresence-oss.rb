# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.22.3"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "c6c1e5bc62e6405fe24bdef4ac0edce2259120545352aab6876b821fd7730a49" if OS.mac? && Hardware::CPU.intel?
  sha256 "684941fbbf17d2d379451946578a2d3108bf0926d96163294237a4f58d8400fb" if OS.mac? && Hardware::CPU.arm?
  sha256 "d86ad7cd5082e3b40b85e2b3c0f36821f23f02457c6da21f93a57b5b44501621" if OS.linux? && Hardware::CPU.intel?
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
