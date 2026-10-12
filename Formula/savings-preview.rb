class SavingsPreview < Formula
  desc "Read a cluster's usage history and show what Thoras would have saved"
  homepage "https://github.com/thoras-ai/savings-preview"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.5/savings-preview_v0.2.5_darwin_arm64.tar.gz"
      sha256 "1414948fcde774b2f30922ae8d67c8105a8d11b3e80747e6837be6dd674b07bc"
    end
    on_intel do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.5/savings-preview_v0.2.5_darwin_amd64.tar.gz"
      sha256 "4ca89a6f1c34ef20b5d9bacdafc338b30d08dd187af1f80ebb1e869966d5ac89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.5/savings-preview_v0.2.5_linux_arm64.tar.gz"
      sha256 "2cbc2320a4a5a0848528682b8160c230283ff587ab78331b83f27d908be7ce45"
    end
    on_intel do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.5/savings-preview_v0.2.5_linux_amd64.tar.gz"
      sha256 "2f59c886d22a90f5700516a9bdb25b78a18d013efe7a56a1d05919a8d9dd0b7b"
    end
  end

  def install
    bin.install "savings-preview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/savings-preview --version")
  end
end
