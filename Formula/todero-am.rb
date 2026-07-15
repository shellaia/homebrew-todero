class ToderoAm < Formula
  desc "Todero Artifact Manager CLI"
  homepage "https://github.com/shellaia/todero-artifact-repository-manager"
  version "1.0.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.2_darwin_arm64.tar.gz"
      sha256 "519152a0ebc20a9e943a474eeee0f353c558bce7bf47478b928d4b2b82921f2c"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.2_darwin_amd64.tar.gz"
      sha256 "d2edf45d89abd9180b970c0f8b60c99e62954a6176a183b2b69ec1da5d2d713f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.2_linux_arm64.tar.gz"
      sha256 "f68075a89eb42406c797b3815b4d6837f486ef96be00b16bf5f5f88c3503ae11"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_1.0.2_linux_amd64.tar.gz"
      sha256 "9f7c436bbcef4f255c3643ead3b6d45b95a6cd89415d5cc0fcad1863ffc92d48"
    end
  end

  def install
    bin.install "todero-am"
  end

  test do
    assert_match "todero-artifact-manager", shell_output("#{bin}/todero-am --help 2>&1", 2)
  end
end
