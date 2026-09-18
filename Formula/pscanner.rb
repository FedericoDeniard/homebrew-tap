class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.3/pscanner_1.1.3_darwin-arm64.tar.gz"
  version "1.1.3"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.3/pscanner_1.1.3_darwin-arm64.tar.gz"
      sha256 "f7d19c2ef00ef9c87038c3f1d39dd872349ea8a89e2590c81ffaeaf8d589573e"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.3/pscanner_1.1.3_darwin-x86_64.tar.gz"
      sha256 "c2f79bc9216a7a947584eff709fbff3d6592ad754c2224b127f5d30dd5299813"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.3/pscanner_1.1.3_linux-x86_64.tar.gz"
      sha256 "ff99c048b515c375f2ed04d2bab1e00bbcbcd13ef6811106070cb9baa9a752d9"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.3/pscanner_1.1.3_linux-arm64.tar.gz"
      sha256 "5e52fab675ec12758909d39173b592a2e312314ae8afcd5cd11620ac3041684c"
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
