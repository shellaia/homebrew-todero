class ToderoNative < Formula
  desc "Todero Protocol V3 native runtime library"
  homepage "https://shellaia.com"
  version "0.0.30"
  url "https://brew.social100.com/todero-native/channels/stable/todero-native-darwin-aarch64-0.0.30.tar.gz"
  sha256 "d3144fbbac0ca3c918da198763926abe0e9ee576f7fc6e982c7601e4caa92e87"

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
