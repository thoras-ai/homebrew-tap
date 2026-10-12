# Homebrew formula for savings-preview. scripts/homebrew_formula.py fills in the
# version, download URLs and checksums for each release; docs/releasing.md
# describes how to publish the result to the tap.
class SavingsPreview < Formula
  desc "Read a cluster's usage history and show what Thoras would have saved"
  homepage "https://github.com/thoras-ai/savings-preview"
  version "0.2.3"

  # The repository is private, so the archives are fetched through the GitHub
  # API with a token that can read it.
  HEADERS = ["Accept: application/octet-stream", "X-GitHub-Api-Version: 2022-11-28"].tap do |h|
    token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")
    h << "Authorization: Bearer #{token}" unless token.empty?
  end.freeze

  on_macos do
    on_arm do
      url "https://api.github.com/repos/thoras-ai/savings-preview/releases/assets/624003680", headers: HEADERS
      sha256 "908e2eb822d45ebb422835d2c2f3fc793c325896185ec78049a941a2cd55667a"
    end
    on_intel do
      url "https://api.github.com/repos/thoras-ai/savings-preview/releases/assets/624003671", headers: HEADERS
      sha256 "e6a2d1187f9baed4aa6444a2d07fc3b91389b0a8e8352bc6f77efd325dfc9aaa"
    end
  end

  on_linux do
    on_arm do
      url "https://api.github.com/repos/thoras-ai/savings-preview/releases/assets/624003672", headers: HEADERS
      sha256 "d811df141bcbca233675a738474ad576d422caf7797978ae704e61158ff846a5"
    end
    on_intel do
      url "https://api.github.com/repos/thoras-ai/savings-preview/releases/assets/624003674", headers: HEADERS
      sha256 "fbc6986a46e566c7dbda39c8163d086a820e233b939e13cbd3d23e433acc11b6"
    end
  end

  def install
    bin.install "savings-preview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/savings-preview --version")
  end
end
