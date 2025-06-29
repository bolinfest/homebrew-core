# frozen_string_literal: true

# Formula for installing the Codex CLI tool.
class Codex < Formula
  desc     "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url      "https://github.com/openai/codex/archive/2925136536b06a324551627468d17e959afa18d4.tar.gz"
  version  "0.2.0-alpha.2"
  sha256   "314bbd1c705e2262d146d4924bc864fc3e61293b5cb27bbb94306e1c64c4e6f4"
  license  "Apache-2.0"
  head     "https://github.com/openai/codex.git", branch: "main"

  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    ENV["OPENSSL_DIR"] = Formula["openssl@3"].opt_prefix
    ENV["OPENSSL_NO_VENDOR"] = "1"

    system "cargo", "install", "--bin", "codex", *std_cargo_args(path: "codex-rs/cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex --version")
  end
end
