class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.0/pscanner_1.3.0_darwin-arm64.tar.gz"
  version "1.3.0"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.0/pscanner_1.3.0_darwin-arm64.tar.gz"
      sha256 "04ea7a2cb4f62f188b88b2ac506c594559c0e5380f7b9a3fdd7100c46169dc99"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.0/pscanner_1.3.0_darwin-x86_64.tar.gz"
      sha256 "36e01ea060d89e534f9f5e080222c0db847531842ae98e74f3c91d1a0ae86d40"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.0/pscanner_1.3.0_linux-x86_64.tar.gz"
      sha256 "03fdeb4b013eb5da6c535704f244d1af616fac7302b0210359cd18f9d9fee344"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.3.0/pscanner_1.3.0_linux-arm64.tar.gz"
      sha256 "6da9e381443bea1a331d75922f1c26a3ce1b9f6ecac633e60e30138bd36e1341"
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
