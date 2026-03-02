class ToderoNative < Formula
  desc "Todero native protocol runtime library"
  homepage "https://github.com/biblip/todero"
  url "https://brew.social100.com/todero/brew/todero-native-0.1.75.tar.gz"
  sha256 "940b16059aa5c43d0103c4a10e9a1531f22bc4c32a108725fdf3f6cf8201757f"
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
