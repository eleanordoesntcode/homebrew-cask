cask "ghdl" do
  version "5.0.1"

  on_arm do
    on_ventura do
      sha256 "176f58857caca8039215f9ead3c92b5ce0558a0434152957ca2b219d5b966443"
      arch "ghdl-llvm-#{version}-macos13-x86_64"

      caveats do
        requires_rosetta
      end
    end
    on_sonoma do
      sha256 "47e9cb8f9d3306e9a896971b2a0acef13776e5b98d71745a2e61d5732d5ec964"
      arch "ghdl-llvm-#{version}-macos14-aarch64"
    end
    on_sequoia do
      sha256 "efc688710c220bd7a89735e99455531f9b2867319dc0dafa90814e301c555086"
      arch "ghdl-llvm-#{version}-macos15-aarch64"
    end
  end
  on_intel do
    sha256 "176f58857caca8039215f9ead3c92b5ce0558a0434152957ca2b219d5b966443"
    arch "ghdl-llvm-#{version}-macos13-x86_64"
  end

  url "https://github.com/ghdl/ghdl/releases/download/v#{version}/#{arch}.tar.gz"
  name "ghdl"
  desc "VHDL 2008/93/87 simulator"
  homepage "https://github.com/ghdl/ghdl/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  binary "#{arch}/bin/ghdl"
  binary "#{arch}/bin/ghwdump"
  binary "#{arch}/bin/ghdl1-llvm"

  postflight do
    puts "Creating library symlinks in #{HOMEBREW_PREFIX}/include and #{HOMEBREW_PREFIX}/lib"
    File.symlink("#{staged_path}/#{arch}/include/ghdl", "#{HOMEBREW_PREFIX}/include/ghdl")
    File.symlink("#{staged_path}/#{arch}/lib/ghdl", "#{HOMEBREW_PREFIX}/lib/ghdl")
  end

  uninstall_postflight do
    puts "Removing library symlinks in #{HOMEBREW_PREFIX}/include and #{HOMEBREW_PREFIX}/lib"
    File.unlink("#{HOMEBREW_PREFIX}/#{arch}/include/ghdl", "#{HOMEBREW_PREFIX}/#{arch}/lib/ghdl")
  end

  # No zap stanza required
end
