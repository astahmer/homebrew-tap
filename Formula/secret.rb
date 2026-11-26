class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.2.0/secret-2.2.0-universal.tar.gz"
      sha256 "52fe4c39a78e1f3cd72ce21c1cb2b28a80cecece3a05bc153718525d37fe01b3"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.2.0/secret-2.2.0-universal.tar.gz"
      sha256 "52fe4c39a78e1f3cd72ce21c1cb2b28a80cecece3a05bc153718525d37fe01b3"
    end
  end

  def install
    bin.install "secret-2.2.0-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.2.0", shell_output("#{bin}/secret version")
  end
end
