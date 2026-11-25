class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.2/secret-2.1.2-universal.tar.gz"
      sha256 "e3d987aaa1141f23595fda57381823bb38094cd335c9ab52e5cec12da448d96e"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.2/secret-2.1.2-universal.tar.gz"
      sha256 "e3d987aaa1141f23595fda57381823bb38094cd335c9ab52e5cec12da448d96e"
    end
  end

  def install
    bin.install "secret-2.1.2-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.1.2", shell_output("#{bin}/secret version")
  end
end
