class SamFormatted < Formula
  desc "AWS SAM CLI local development script"
  homepage "https://github.com/SevenDogsNTwoCats/sam-formatted"
  url "https://github.com/SevenDogsNTwoCats/sam-formatted/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "your_sha256_checksum_here"
  license "MIT"

  depends_on "awscli"
  depends_on "jq"
  depends_on "nodemon"

  def install
    bin.install "bin/sam-formatted.sh" => "sam-formatted"
    # Additional installation steps can be added here if necessary
  end

  test do
    system "#{bin}/sam-formatted", "--help"
  end
end