class ToderoAm < Formula
  desc "Todero Artifact Manager CLI"
  homepage "https://github.com/shellaia/todero-artifact-repository-manager"
  version "0.0.21"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.21_darwin_arm64.tar.gz"
      sha256 "dd1d42753db0d41c65a7b43a22dd3afa0c90b394454c6f10530eb3600b3dc687"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.21_darwin_amd64.tar.gz"
      sha256 "272fdc03e7d6d65befd2f4afc6f3ae16cb81eea4c4843b77ba6171eb1a5d2749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.21_linux_arm64.tar.gz"
      sha256 "b69daad2499f5c319c6d82989a04c193ec390f50d36908f41e3e15d2236801cf"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.21_linux_amd64.tar.gz"
      sha256 "30dfbd42dd929f0af131286d40ceab91d9372939e1eacc8fee5f1e975fdf6c61"
    end
  end

  def install
    bin.install "todero-am"
  end

  test do
    assert_match "todero-artifact-manager", shell_output("#{bin}/todero-am --help 2>&1", 2)
  end
end
