require "formula"

class Marooned < Formula
  homepage "https://github.com/Keithbsmiley/marooned/"
  url "http://github.com/Keithbsmiley/marooned/marooned-__VERSION__.tar.gz"
  sha1 "__SHA__"

  depends_on "xcproj" => :recommended

  def install
    prefix.install "defaults", "templates", "vendor"
    prefix.install "lib" => "rubylib"

    bin.install "src/marooned"
  end

  test do
    system "#{bin}/marooned", "--version"
  end
end
