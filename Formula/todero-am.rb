class ToderoAm < Formula
  desc "Todero Artifact Manager CLI"
  homepage "https://github.com/shellaia/todero-artifact-repository-manager"
  version "0.0.16"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.16_darwin_arm64.tar.gz"
      sha256 "68a6548924aa9f2cbc74367566c6ffcd9f2eafd117a0982c298c51d47ccd8fa7"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.16_darwin_amd64.tar.gz"
      sha256 "d1e9e32dfeacabe8db9f9920a2be4a93ae30c9996b10f0fb6236f8f9ff8cdeee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.16_linux_arm64.tar.gz"
      sha256 "8cdcc85ea909889f58302c022564a7713fe48df4d4e95a24972b893660a60ad6"
    else
      url "https://brew.social100.com/todero-am/channels/stable/tarballs/todero-am_0.0.16_linux_amd64.tar.gz"
      sha256 "b584c44671f9ce6083d1abba1515921b89bcbb972b0f3b7315659afd679b7924"
    end
  end

  def install
    bin.install "todero-am"
  end

  test do
    assert_match "todero-artifact-manager", shell_output("#{bin}/todero-am --help 2>&1", 2)
  end
end
