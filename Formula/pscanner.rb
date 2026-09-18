class Pscanner < Formula
  desc "TUI to view and manage TCP/UDP ports in use"
  homepage "https://github.com/FedericoDeniard/PortScanner"
  url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.2.0/pscanner_1.2.0_darwin-arm64.tar.gz"
  version "1.2.0"
  license "ISC"

  on_macos do
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.2.0/pscanner_1.2.0_darwin-arm64.tar.gz"
      sha256 "61669910b68c4e4ffa4c9926617d97356bc01d16c6eefee16aade32ec44ac6a7"
    end
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.2.0/pscanner_1.2.0_darwin-x86_64.tar.gz"
      sha256 "b0c80eae959e9aa8904bac8242163e60a2b068aff23c810021c12e31b7cece59"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.2.0/pscanner_1.2.0_linux-x86_64.tar.gz"
      sha256 "d6c9a7f53bf15f4506da88720fac78b91f5583b2e8c0589aaa215b651eb0d29e"
    end
    on_arm do
      url "https://github.com/FedericoDeniard/PortScanner/releases/download/v1.2.0/pscanner_1.2.0_linux-arm64.tar.gz"
      sha256 "ea43ab826250c814c4e25a11faf4fa49f191aad142bcfec7a5e4b19eb7c21f63"
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
