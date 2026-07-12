class ToderoJvmRunner < Formula
  desc "Todero component runner"
  homepage "https://github.com/biblip/todero"
  url "https://brew.social100.com/todero/channels/stable/todero-jvm-runner-1.0.4.tar.gz"
  sha256 "e608d6f57ba6798920f220fde4050d84ea2abe5f187ec6f7b7c7318a81bf4e04"
  license "Apache-2.0"
  depends_on "openjdk@17"


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
    system "#{bin}/todero-runner", "--help"
  end
end
