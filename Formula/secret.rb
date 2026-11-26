class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.5/secret-2.1.5-universal.tar.gz"
      sha256 "9867ac75c7af8c65302c8c117f1fb03e0f7eff81ea9f15b27ee22d0f05879647"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.5/secret-2.1.5-universal.tar.gz"
      sha256 "9867ac75c7af8c65302c8c117f1fb03e0f7eff81ea9f15b27ee22d0f05879647"
    end
  end

  def install
    bin.install "secret-2.1.5-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.1.5", shell_output("#{bin}/secret version")
  end
end
