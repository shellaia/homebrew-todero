class ToderoNative < Formula
  desc "Todero native protocol runtime library"
  homepage "https://github.com/biblip/todero"
  url "https://brew.social100.com/todero/todero-native-0.1.76.tar.gz"
  sha256 "b8594458c01f7d201a67a34f0d78669c053162bf140e0bc19c636f67318ca316"
  license "Apache-2.0"


  def install
    libexec.install Dir["libexec/*"]
    bin.install Dir["bin/*"]
    if Dir.exist?("usr/share")
      share.install Dir["usr/share/*"]
    end
  end

  def post_install
    templates_src = libexec/"scripts/templates"
    templates_dst = Pathname.new(Dir.home)/".todero/etc/templates"
    return unless templates_src.directory?
    templates_dst.mkpath
    cp_r templates_src.children, templates_dst
  end

  test do
    system "#{bin}/todero-native-info", "--help"
  end
end
