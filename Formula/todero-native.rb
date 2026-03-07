class ToderoNative < Formula
  desc "Todero Protocol V3 native runtime library"
  homepage "https://shellaia.com"
  version "0.0.34"
  url "https://brew.social100.com/todero-native/channels/stable/todero-native-darwin-aarch64-0.0.34.tar.gz"
  sha256 "e81a48e368fffd9bb319a6f72d31c25a930f362b68336df2b2b2082fe80febf8"

  depends_on arch: :arm64

  def install
    source_dir = buildpath
    odie "missing native payload file: #{source_dir}/libv3_ffi.dylib" unless (source_dir/"libv3_ffi.dylib").exist?
    odie "missing native payload file: #{source_dir}/metadata.json" unless (source_dir/"metadata.json").exist?

    native_dir = libexec/"native/darwin-aarch64"
    native_dir.mkpath
    native_dir.install source_dir.children
    ln_sf "darwin-aarch64", libexec/"native/current"

    (bin/"tninfo").write <<~EOS
      #!/usr/bin/env bash
      set -euo pipefail
      if [[ -n "${1:-}" && "${1:-}" != "--libdir" ]]; then
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
