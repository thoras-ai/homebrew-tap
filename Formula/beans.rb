class Beans < Formula
  desc "Repo memory for decisions and designs, for engineers and coding agents"
  homepage "https://github.com/thoras-ai/beans"
  url "https://github.com/thoras-ai/beans.git", tag: "v0.5.0", revision: "ccf3e1443860010d05a2abe07bb7f710412edb96"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/thoras-ai/beans/internal/version.Version=#{version}
      -X github.com/thoras-ai/beans/internal/version.Commit=#{Utils.git_short_head}
      -X github.com/thoras-ai/beans/internal/version.Date=#{time.iso8601}
    ]
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags:, output: bin/"beans"), "./cmd/beans"
    system "go", "build", *std_go_args(ldflags:, output: bin/"beans-tui"), "./cmd/beans-tui"
  end

  def caveats
    <<~EOS
      This is the Thoras build. It replaces hmans/beans/beans, which uses the
      same binary name but can't read decision or design beans. If you have it:
        brew uninstall --cask hmans/beans/beans
        brew untap hmans/beans
        brew link --overwrite thoras-ai/tap/beans
    EOS
  end

  test do
    assert_match "[thoras-ai/beans]", shell_output("#{bin}/beans version")
    system "git", "init", "-q"
    system bin/"beans", "init", "--prefix", "test"
    system bin/"beans", "create", "Use the Thoras build", "--type", "decision", "--status", "accepted",
           "--ref", "doc:README.md", "--decided-at", "2026-11-06"
    assert_match "Use the Thoras build", shell_output("#{bin}/beans list --type decision")
  end
end
