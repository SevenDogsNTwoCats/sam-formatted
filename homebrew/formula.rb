# homebrew-sam-formatted/sam-formatted.rb
class SamFormatted < Formula
  desc "A command-line tool for formatting and displaying logs from AWS SAM"
  homepage "https://github.com/SevenDogsNTwoCats/sam-formatted"
  url "https://github.com/SevenDogsNTwoCats/sam-formatted/archive/v1.0.1.tar.gz"
  sha256 "YOUR_TARBALL_SHA256"
  license "MIT"

  depends_on "jq"

  def install
    bin.install "bin/sam-formatted.sh" => "sam-formatted"
  end

  test do
    system "#{bin}/sam-formatted", "--help"
  end
end