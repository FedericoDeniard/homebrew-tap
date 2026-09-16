class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_darwin-arm64.tar.gz"
  version "1.1.1"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_darwin-arm64.tar.gz"
      sha256 "8dadee90c4c056e57e8ff687bc192670ccd33630a4527bf6d2d6ea04b43012e1"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_darwin-x86_64.tar.gz"
      sha256 "245de2b15a3ade37a5f5cead0448599aa5226ca078eb8ef222384b12195356e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_linux-x86_64.tar.gz"
      sha256 "f7babe591e5bda348b47055b42430f0f244249046db88c1deb84e1e12f663b65"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.1/pscanner_1.1.1_linux-arm64.tar.gz"
      sha256 "70459ba01debb2d3b642a55a1a0f867f7443325c973f12cf47abb0f6bdf7d5f3"
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
