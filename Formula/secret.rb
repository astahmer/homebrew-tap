class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.7.0/secret-2.7.0-universal.tar.gz"
      sha256 "a0631f3eaea83bef16ee88ac070d9c68a5883fe350fef41a1d69127e3b1aa0bb"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.7.0/secret-2.7.0-universal.tar.gz"
      sha256 "a0631f3eaea83bef16ee88ac070d9c68a5883fe350fef41a1d69127e3b1aa0bb"
    end
  end

  def install
    bin.install "secret-2.7.0-universal/secret" => "secret"
    man1.install "secret-2.7.0-universal/share/man/man1/secret.1"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.7.0", shell_output("#{bin}/secret version")
  end
end
