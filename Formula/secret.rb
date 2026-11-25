class Secret < Formula
  desc "Value-minimizing secret manager for configured aliases"
  homepage "https://github.com/astahmer/secret-cli"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.1/secret-2.1.1-arm64.tar.gz"
      sha256 "75727cb35012b897cf25ae99796a3759ade0d1f0171f4b015007b004d102b91a"
    else
      url "https://github.com/astahmer/secret-cli/releases/download/v2.1.1/secret-2.1.1-arm64.tar.gz"
      sha256 "75727cb35012b897cf25ae99796a3759ade0d1f0171f4b015007b004d102b91a"
    end
  end

  def install
    bin.install "secret-2.1.1-universal/secret" => "secret"
  end

  test do
    assert_match "secret 2.1.1", shell_output("#{bin}/secret version")
  end
end
