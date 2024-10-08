# This script is generated automatically by the release automation code in the
# Telepresence repository:
class TelepresenceOss < Formula
  desc "Local dev environment attached to a remote Kubernetes cluster"
  homepage "https://telepresence.io"
  version "2.20.0"

  BASE_URL = "https://app.getambassador.io/download/tel2oss/releases/download"
  ARCH = Hardware::CPU.arm? ? "arm64" : "amd64"
  OPERATING_SYSTEM = OS.mac? ? "darwin" : "linux"
  PACKAGE_NAME = "telepresence-#{OPERATING_SYSTEM}-#{ARCH}"

  url "#{BASE_URL}/v#{version}/#{PACKAGE_NAME}"

  sha256 "7d8607b2f6e51410cc586cdc8d06efcfa252d085268caa31630f598c84f8768c" if OS.mac? && Hardware::CPU.intel?
  sha256 "463c3d68000cc6f3201a0af4129cdfd8cda14465432c5bcf40c3d8c399e7cee0" if OS.mac? && Hardware::CPU.arm?
  sha256 "c37b1b71d19d41bbc5ab15014f4dba58a4e6f5689af5e662ffe388d297857bdf" if OS.linux? && Hardware::CPU.intel?
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
