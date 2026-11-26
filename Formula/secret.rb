class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.5.0/secret-2.5.0-universal.tar.gz"
      sha256 "592c787457319414fdc0799da335398778ad67fbd621939ad03de8ae697c0c49"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.5.0/secret-2.5.0-universal.tar.gz"
      sha256 "592c787457319414fdc0799da335398778ad67fbd621939ad03de8ae697c0c49"
    end
  end

  def install
    bin.install "secret-2.5.0-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.5.0", shell_output("#{bin}/secret version")
  end
end
