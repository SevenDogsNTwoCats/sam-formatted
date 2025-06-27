class SamFormatted < Formula
  desc "Pretty-printed AWS SAM CLI output"
  homepage "https://github.com/SevenDogsNTwoCats/sam-formatted"
  url "https://github.com/SevenDogsNTwoCats/sam-formatted/archive/v1.0.0.tar.gz"
  sha256 "YOUR_TARBALL_SHA256"
  license "MIT"

  depends_on "jq"
  depends_on "node"

  def install
    bin.install "run-sam-formatted.sh" => "sam-formatted"
  end

  test do
    system "#{bin}/sam-formatted", "--help"
  end
end