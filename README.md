# Thoras Homebrew tap

```bash
brew install thoras-ai/tap/savings-preview
brew install thoras-ai/tap/beans   # Thoras engineers only
```

[savings-preview](https://github.com/thoras-ai/savings-preview) reads a Kubernetes cluster's existing usage history and shows what Thoras would have saved. It is read-only and installs nothing in the cluster.

Each savings-preview release updates `Formula/savings-preview.rb`.

[beans](https://github.com/thoras-ai/beans) is repo memory for decisions and designs. Its source is private, so the formula builds from source and needs Git access to that repository. Log in with `gh auth login` and run `gh auth setup-git` first, with `gh` on your `PATH`. If you use several GitHub accounts and the install fails with `Repository not found`, install with your Thoras token. With `gh` 2.40.0 or later, log in to that account and run `HOMEBREW_GITHUB_API_TOKEN="$(gh auth token --user <thoras-login>)" brew install thoras-ai/tap/beans`, so the token isn't pasted into your shell history. Use the full name `thoras-ai/tap/beans`; `hmans/beans/beans` is a different build. Updating `Formula/beans.rb` takes a reviewed PR, because it decides what runs on engineers' machines.
