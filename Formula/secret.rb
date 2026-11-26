class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.4.0/secret-2.4.0-universal.tar.gz"
      sha256 "6eaa8d4518df047f74b1bdb072363f62aa9d801012d265feaa2e71c3b6d92de7"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.4.0/secret-2.4.0-universal.tar.gz"
      sha256 "6eaa8d4518df047f74b1bdb072363f62aa9d801012d265feaa2e71c3b6d92de7"
    end
  end

  def install
    bin.install "secret-2.4.0-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.4.0", shell_output("#{bin}/secret version")
  end
end
