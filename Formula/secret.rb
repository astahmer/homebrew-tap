class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/astahmer/secret-cli/releases/download/v2.1.1/secret-2.1.1-universal.tar.gz"
    sha256 "0f24fadd675f52cfdaf6e9d1288f475a9249e250c7194172123abe0a5ce01268"
  end

  def install
    bin.install "secret-2.1.1-universal/secret" => "secret"
  end

  test do
    assert_match "secret 2.1.1", shell_output("#{bin}/secret version")
  end
end
