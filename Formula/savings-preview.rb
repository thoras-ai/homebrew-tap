class SavingsPreview < Formula
  desc "Read a cluster's usage history and show what Thoras would have saved"
  homepage "https://github.com/thoras-ai/savings-preview"
  version "0.2.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.7/savings-preview_v0.2.7_darwin_arm64.tar.gz"
      sha256 "81811c52f85867d9160f82e80dc292380baca0c7b8017877e7b23aee12ad1a74"
    end
    on_intel do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.7/savings-preview_v0.2.7_darwin_amd64.tar.gz"
      sha256 "a9052349e9da5ce26aff1e4ec8a26dbb7986c8261038f4940440c0ad6b7dbf23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.7/savings-preview_v0.2.7_linux_arm64.tar.gz"
      sha256 "92157a7c21432dd4e46d41461323256186b6146fa53df150b28c66973137e254"
    end
    on_intel do
      url "https://github.com/thoras-ai/savings-preview/releases/download/v0.2.7/savings-preview_v0.2.7_linux_amd64.tar.gz"
      sha256 "a4caa026963d2200f991169db2fe161470a88bca5cb9e9e1e619339f51f4a657"
    end
  end

  def install
    bin.install "savings-preview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/savings-preview --version")
  end
end
