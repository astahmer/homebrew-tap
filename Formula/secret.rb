class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.3.1/secret-2.3.1-universal.tar.gz"
      sha256 "761f5b2cc0c282610bccd522a2a2b00f023dbcd847155292556c701c2251062a"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.3.1/secret-2.3.1-universal.tar.gz"
      sha256 "761f5b2cc0c282610bccd522a2a2b00f023dbcd847155292556c701c2251062a"
    end
  end

  def install
    bin.install "secret-2.3.1-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.3.1", shell_output("#{bin}/secret version")
  end
end
