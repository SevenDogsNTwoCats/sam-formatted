# homebrew-sam-formatted/sam-formatted.rb
class SamFormatted < Formula
  desc "A command-line tool for formatting and displaying logs from AWS SAM"
  homepage "https://github.com/SevenDogsNTwoCats/sam-formatted"
  url "https://github.com/SevenDogsNTwoCats/sam-formatted/archive/v1.0.1.tar.gz"
  sha256 "f9703711e0e001a173371822a8cee9302e63dc6dce8913aa67acf6b46e393bf5"
  license "MIT"

  depends_on "jq", "sam-cli", "node", "npm", "nodemon", "awscli"

  def install
    bin.install "bin/sam-formatted.sh" => "sam-formatted"
  end

  test do
    system "#{bin}/sam-formatted", "--help"
  end
end