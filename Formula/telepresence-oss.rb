# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.23.1"

  BASE_URL = "https://github.com/telepresenceio/telepresence/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "231bd7cdca5f1109ecc711d97ebc34b4c9a851f7a47be33e4e9bb17d65db9e51" if OS.mac? && Hardware::CPU.intel?
  sha256 "ca56a5283b6a60f3684adf584df95c0105799a7a8ea1d00a83d27e4aa504fe9a" if OS.mac? && Hardware::CPU.arm?
  sha256 "5fb3393cac62d1a52e91657a3bfcade812a84d9e7862d9483b23a8c670d9a7c6" if OS.linux? && Hardware::CPU.intel?
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
