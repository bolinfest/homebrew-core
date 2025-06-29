class Codex < Formula
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  version "v0.1.0-alpha.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/openai/codex/releases/download/codex-rs-b289c9207090b2e27494545d7b5404e063bd86f3-1-rust-v0.1.0-alpha.4/codex-x86_64-apple-darwin.tar.gz"
      sha256 "35f5183d459c62c549b1153b5ebdd508b7e09f428b42d4e2835962338f5e8e64"
    elsif Hardware::CPU.arm?
      url "https://github.com/openai/codex/releases/download/codex-rs-b289c9207090b2e27494545d7b5404e063bd86f3-1-rust-v0.1.0-alpha.4/codex-aarch64-apple-darwin.tar.gz"
      sha256 "4f522d73670973bc0cda40ba944006cdcc426cb5b7034f1c5884f4abec50b578"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/openai/codex/releases/download/codex-rs-b289c9207090b2e27494545d7b5404e063bd86f3-1-rust-v0.1.0-alpha.4/codex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e3c464a22a14b51e5904a27ca7d95f7b3028fb5f69cbb9c73cca39ef764deef9"
    elsif Hardware::CPU.arm?
      url "https://github.com/openai/codex/releases/download/codex-rs-b289c9207090b2e27494545d7b5404e063bd86f3-1-rust-v0.1.0-alpha.4/codex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ccb479f3950c24e3c0667dd89d081ccf37eb4e2bebb773ec4c8b1f6b27c907b"
    end
  end

  def install
    # The decompressed .tar.gz contains a single file like codex-<arch>-<os>,
    # so we need to rename it to just "codex" for consistency.
    bin.install Dir["codex-*"].first => "codex"
  end

  test do
    system "#{bin}/codex", "--version"
  end
end
