class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.4/secret-2.1.4-universal.tar.gz"
      sha256 "6bd271e31cad43ca9904b3f393ced54f32f80fd3989a5cb55d60868965cf0983"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.4/secret-2.1.4-universal.tar.gz"
      sha256 "6bd271e31cad43ca9904b3f393ced54f32f80fd3989a5cb55d60868965cf0983"
    end
  end

  def install
    bin.install "secret-2.1.4-universal/secret" => "secret"
  end

  def caveats
    <<~EOS
      The  CLI (Bitwarden) or the macOS Keychain backend is required to store
      values. Run  to check the backend,  to see aliases.
    EOS
  end

  test do
    assert_match "secret 2.1.4", shell_output("#{bin}/secret version")
  end
end
