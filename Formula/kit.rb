class Kit < Formula
  desc "Lightweight AI agent for coding"
  homepage "https://go-kit.dev/"
  url "https://github.com/mark3labs/kit/archive/refs/tags/v0.106.tar.gz"
  sha256 "6bfb1cf07d46d904186de5b508081ca315939ca74e5e2b61b5c6e55ba63cab62"
  license "MIT"

  bottle do
    root_url "https://github.com/mgoodness/homebrew-tap/releases/download/kit-0.105"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dbfe703a894d090aabb43cf0f03a6137a18aa7b7161ed8aab4f459331d4188d8"
    sha256 cellar: :any,                 x86_64_linux: "36f9fb00aa320c5922227b47b34ade099f485348ee5ebbb7ebf29185aa78773a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/kit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kit --version")
  end
end
