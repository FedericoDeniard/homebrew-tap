class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_darwin-arm64.tar.gz"
  version "1.1.1"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_darwin-arm64.tar.gz"
      sha256 "35bb2fb5e39d6279564cb6e675fafe88637845f7f85b9ea37b06bb695f683523"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_darwin-x86_64.tar.gz"
      sha256 "d5b6b1f2cb682663d942748ae5da00c0d7077db2171a32f47ec08aaa90581d9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_linux-x86_64.tar.gz"
      sha256 "8e4aa99eec53acd3116907f8621a1a6763182081bc3c256658b183d94c8f0796"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_linux-arm64.tar.gz"
      sha256 "1925b415be2926d01f835bb52b03754576310f7994547ca70682e0332e7419a5"
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
