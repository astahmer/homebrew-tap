class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.3/secret-2.1.3-universal.tar.gz"
      sha256 "4caefd3057870fb3fc2a99d885b9726f797164d2df7a17b34d0d57a49ce1d7c3"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.3/secret-2.1.3-universal.tar.gz"
      sha256 "4caefd3057870fb3fc2a99d885b9726f797164d2df7a17b34d0d57a49ce1d7c3"
    end
  end

  def install
    bin.install "secret-2.1.3-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.1.3", shell_output("#{bin}/secret version")
  end
end
