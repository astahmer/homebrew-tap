class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.3.0/secret-2.3.0-universal.tar.gz"
      sha256 "f8e8aa35c2886c35b0a30b23c6b0e101d71453ee9a958cf0eaac7c9c5d08b680"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.3.0/secret-2.3.0-universal.tar.gz"
      sha256 "f8e8aa35c2886c35b0a30b23c6b0e101d71453ee9a958cf0eaac7c9c5d08b680"
    end
  end

  def install
    bin.install "secret-2.3.0-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.3.0", shell_output("#{bin}/secret version")
  end
end
