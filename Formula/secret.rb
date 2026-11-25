class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/astahmer/secret-cli/releases/download/v2.1.0/secret-2.1.0-universal.tar.gz"
    sha256 "37451aba1408365bee04bd26c7435b7cf8095c7adcd213224b8c9ba69c0da5ef"
  end

  def install
    bin.install "secret-2.1.0-universal/secret" => "secret"
  end

  test do
    assert_match "secret 2.1.0", shell_output("#{bin}/secret version")
  end
end
