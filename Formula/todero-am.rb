class ToderoAm < Formula
  desc "Todero Artifact Manager CLI"
  homepage "https://github.com/shellaia/todero-artifact-repository-manager"
  version "0.0.19"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.19_darwin_arm64.tar.gz"
      sha256 "c105f0bf5cc6a7e06e27b4eb7bf61d493891d43d7f8ae80038585a68fd299961"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.19_darwin_amd64.tar.gz"
      sha256 "0919337cf9ee9f0d6ea8ddbd3253b39a723e50307d1c079df9957d77048ea522"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.19_linux_arm64.tar.gz"
      sha256 "91869a862c857f973c0874b15de1c5d15d552ea654200a4ff32cd81381a610a8"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.19_linux_amd64.tar.gz"
      sha256 "04635877e2cd3e8c580e12e5d40e4692cfb13f306476aded625eaa3b5e42903d"
    end
  end

  def install
    bin.install "todero-am"
  end

  test do
    assert_match "todero-artifact-manager", shell_output("#{bin}/todero-am --help 2>&1", 2)
  end
end
