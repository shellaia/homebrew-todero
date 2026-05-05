class Todero < Formula
  desc "Todero CLI, server, and admin tools"
  homepage "https://github.com/biblip/todero"
  url "https://brew.social100.com/todero/channels/stable/todero-0.1.112.tar.gz"
  sha256 "dc958e8e9b4844155130b9d21b637e8b8973c905d2ee87e55df9a3951b842fad"
  license "Apache-2.0"
  depends_on "openjdk@17"
  uses_from_macos "unzip"
  depends_on "unzip" if OS.linux?

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
    system "#{bin}/todero", "--help"
  end
end
