class TagAg < Formula
  desc "Instantly jump to your ag or ripgrep matches"
  homepage "https://github.com/jeffreyc/tag"
  version "2.0.0"
  license "MIT"
  head "https://github.com/jeffreyc/tag.git", branch: "master"

  depends_on "go" => :build if build.head?
  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeffreyc/tag/releases/download/v#{version}/tag_darwin_arm64.tar.gz"
      sha256 "ab3ac153eaf36158d7141af39f6ba9c960de85297bff4db243640aabbc070303"
    else
      url "https://github.com/jeffreyc/tag/releases/download/v#{version}/tag_darwin_amd64.tar.gz"
      sha256 "ecb11fca74f76205060df7bebd03b2d46895ec4efac9b22b30b06fc5dbe0777e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jeffreyc/tag/releases/download/v#{version}/tag_linux_arm64.tar.gz"
      sha256 "15c616ced2e591f983c5cdfc2c2175c29e640233effcc72816e809372fba5610"
    else
      url "https://github.com/jeffreyc/tag/releases/download/v#{version}/tag_linux_amd64.tar.gz"
      sha256 "38dfb39dce3c8505a753b0e727c1d652473cc1ebb28e6325d24fe9911164ebae"
    end
  end

  def install
    if build.head?
      system "go", "build", *std_go_args(output: bin/"tag")
    else
      bin.install "tag"
    end
  end

  test do
    system bin/"tag", "--help"
  end
end
