class ToderoNative < Formula
  desc "Todero Protocol V3 native runtime library"
  homepage "https://shellaia.com"
  version "0.0.28"
  url "https://brew.social100.com/todero-native/channels/stable/todero-native-darwin-aarch64-0.0.28.tar.gz"
  sha256 "58497544679e54643d7eb049a712b30094258d2ddfacbbfec7eb5cabc394347a"

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
