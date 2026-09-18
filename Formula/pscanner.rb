class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.2/pscanner_1.1.2_darwin-arm64.tar.gz"
  version "1.1.2"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.2/pscanner_1.1.2_darwin-arm64.tar.gz"
      sha256 "128169722df5f11ecf70f384b4c904814944300e86c9e4100f1d9baadfb0e059"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.2/pscanner_1.1.2_darwin-x86_64.tar.gz"
      sha256 "ae1a0d326ca04bc63348d9f9aeeba732ffed222fd110ad68898ed640b4d90cd5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.2/pscanner_1.1.2_linux-x86_64.tar.gz"
      sha256 "f40bbf1e006d0f73ea997dd3290ef8e80e904e897ab5e621c0a50361af6b5a1b"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.1.2/pscanner_1.1.2_linux-arm64.tar.gz"
      sha256 "f2f93f7780dbca2cf61d748ed71bee120469126e29999fb80afb74730f3894e3"
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
