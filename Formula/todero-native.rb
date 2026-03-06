class ToderoNative < Formula
  desc "Todero Protocol V3 native runtime library"
  homepage "https://shellaia.com"
  version "0.0.24"
  url "https://social100-brew-repo.s3.us-east-1.amazonaws.com/todero-native/todero-native-darwin-aarch64-0.0.24.tar.gz"
  sha256 "1a1a34d4b5efdf444f699f864968a9a125ddf4feaca8bd6f5b70b009f67aba6a"

  depends_on arch: :arm64

  def install
    native_dir = libexec/"native/darwin-aarch64"
    native_dir.mkpath
    cp_r Dir["darwin-aarch64/*"], native_dir
    ln_sf "darwin-aarch64", libexec/"native/current"

    (bin/"tninfo").write <<~EOS
      #!/usr/bin/env bash
      set -euo pipefail
      if [[ "${1:-}" != "--libdir" ]]; then
        echo "usage: tninfo --libdir" >&2
        exit 2
      fi
      echo "#{libexec}/native/current"
    EOS
  end

  def caveats
    <<~EOS
      Set TODERO_V3_NATIVE_PATH to use this native runtime:
        export TODERO_V3_NATIVE_PATH="#{libexec}/native/current"
    EOS
  end

  test do
    assert_match "native/current", shell_output("#{bin}/tninfo --libdir")
  end
end
