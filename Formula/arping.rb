class Arping < Formula
  desc "Utility to check whether MAC addresses are already taken on a LAN"
  homepage "https://github.com/ThomasHabets/arping"
  url "https://github.com/ThomasHabets/arping/archive/arping-2.22.tar.gz"
  sha256 "3e984dd52eb1b6f0ba4f40f1b92e69810232a4314640b1921ee91cf6f2380e1f"
  license "GPL-2.0-or-later"

  bottle do
    sha256 cellar: :any, arm64_big_sur: "e7dd0f484b0f78ab66261349291da03e832b5bf98d150ead3e30d060614d6955"
    sha256 cellar: :any, big_sur:       "febbca65b44412fcb94a7a1125fe9bedd4e0792a2d1e928e7069eb32ce7945e8"
    sha256 cellar: :any, catalina:      "24cb6f161d06e9f2bc38d819a7d724d3f0d337f322cbb6e5b685118829e6cd32"
    sha256 cellar: :any, mojave:        "19a737592d390d0bdf06e03c1a49e22a2d9860e065153e1b84bd325fcfa7640c"
    sha256 cellar: :any, high_sierra:   "5019bb51a8cf372fd070b0b2686a3bbb2b7c262e2d39c8cae83d0c384971a82c"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libnet"

  uses_from_macos "libpcap"

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{sbin}/arping", "--help"
  end
end
