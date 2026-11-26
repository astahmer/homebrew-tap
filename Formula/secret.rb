class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.6.0/secret-2.6.0-universal.tar.gz"
      sha256 "56918d0a3f662b41cbf200588e8b3704d60d7f04746e0d8dbc43bc8ac1147090"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.6.0/secret-2.6.0-universal.tar.gz"
      sha256 "56918d0a3f662b41cbf200588e8b3704d60d7f04746e0d8dbc43bc8ac1147090"
    end
  end

  def install
    bin.install "secret-2.6.0-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.6.0", shell_output("#{bin}/secret version")
  end
end
