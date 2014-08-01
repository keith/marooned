require "formula"

class Marooned < Formula
  homepage "https://github.com/Keithbsmiley/marooned/"
  url "http://keithbsmiley.github.io/marooned/marooned-__VERSION__.tar.gz"
  sha1 "__SHA__"

  depends_on "xcproj" => :recommended

  def install
    prefix.install "vendor"
    prefix.install "lib" => "rubylib"

    bin.install "src/marooned"
  end

  test do
    system "#{bin}/marooned", "--version"
  end
end
