class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.1/pscanner_1.3.1_darwin-arm64.tar.gz"
  version "1.3.1"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.1/pscanner_1.3.1_darwin-arm64.tar.gz"
      sha256 "1f7da20ee2311491e3eb2be228fa71f24b58808574e63c78cd9aaf62ee36d345"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.1/pscanner_1.3.1_darwin-x86_64.tar.gz"
      sha256 "95f04132f08e30c8c7a550ccfa3b39e5b0c9934a59c13515f037fd9f3fb5a584"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.1/pscanner_1.3.1_linux-x86_64.tar.gz"
      sha256 "78df6c8edb8902ef4f512d00898cf04c37dddd855afa5d967a90baf0d48dcbc6"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.1/pscanner_1.3.1_linux-arm64.tar.gz"
      sha256 "59ebe7e0eaab351b865c0c04f7207ad59f98ad7cf389c5a27ea2a7dafb362612"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    libexec.install "pscanner-#{os}-#{arch}", "portmon-#{os}-#{arch}"
    (bin/"pscanner").write_env_script libexec/"pscanner-#{os}-#{arch}",
      PORTMON_BIN: libexec/"portmon-#{os}-#{arch}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pscanner --version")
  end
end
