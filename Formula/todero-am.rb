class ToderoAm < Formula
  desc "Todero Artifact Manager CLI"
  homepage "https://github.com/shellaia/todero-artifact-repository-manager"
  version "1.0.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.1_darwin_arm64.tar.gz"
      sha256 "7857451f1d25deaed0344d228a2abf7ecc97f1d1d040edbe0ae0f4fbd113e694"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.1_darwin_amd64.tar.gz"
      sha256 "76bd66f24ee2ce7d8070235335abaa2dceaa49c7fb733c94ac1fe44fdf626890"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.1_linux_arm64.tar.gz"
      sha256 "6917608deccf20205a055da9ff89eee97fbc51dc89d569805499cf444fbc1a3a"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.1_linux_amd64.tar.gz"
      sha256 "fdc81c45d81671ec8381eb524935fde11621756b079b4e057fff5e8f4efa5d5f"
    end
  end

  def install
    bin.install "todero-am"
  end

  test do
    assert_match "todero-artifact-manager", shell_output("#{bin}/todero-am --help 2>&1", 2)
  end
end
