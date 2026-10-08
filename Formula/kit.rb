class Kit < Formula
  desc "Lightweight AI agent for coding"
  homepage "https://go-kit.dev/"
  url "https://github.com/mark3labs/kit/archive/refs/tags/v0.124.1.tar.gz"
  sha256 "b022f7716ee4ba3f480705b1854494a4e3541c58c48a0195b318c26b3616e2b3"
  license "MIT"

  bottle do
    root_url "https://github.com/mgoodness/homebrew-tap/releases/download/kit-0.107"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "aee8c5f5f7e6fd07739ef740c138b656548660739728ff762463c4522abca642"
    sha256 cellar: :any,                 x86_64_linux: "ec0059fa8a60589c3bd31f1c1f6611956952d48412093a32babf2eeb1a254a87"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/kit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kit --version")
  end
end
