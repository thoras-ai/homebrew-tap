class SavingsPreview < Formula
  desc "Read a cluster's usage history and show what Thoras would have saved"
  homepage "https://github.com/thoras-ai/savings-preview"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.6/savings-preview_v0.2.6_darwin_arm64.tar.gz"
      sha256 "db067782d0253e8ff25b6e3fc48b9c0305616bac664af65daa43949cd7c0b82b"
    end
    on_intel do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.6/savings-preview_v0.2.6_darwin_amd64.tar.gz"
      sha256 "068c53be0f2fe41f114479fe5a7f025ab49ce16d4a3d950aaf6f57bce90bdf1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.6/savings-preview_v0.2.6_linux_arm64.tar.gz"
      sha256 "e4a416839fece1280799e8c0d514679aa72ea82f3112a8a24dcc1ada15ea469f"
    end
    on_intel do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.6/savings-preview_v0.2.6_linux_amd64.tar.gz"
      sha256 "e641042eda99804e0e64d0bc761a4a5d2818a4b24859d06c6da74a7624a31a98"
    end
  end

  def install
    bin.install "savings-preview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/savings-preview --version")
  end
end
