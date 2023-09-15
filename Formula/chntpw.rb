class Chntpw < Formula
  desc "The Offline NT Password Editor"
  homepage "https://github.com/minacle/chntpw"
  url "https://github.com/minacle/chntpw/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "51625a7b7c67120830669d309cb5f11f0ec1815a753cbf33e28715f8a8befff1"
  head "https://github.com/minacle/chntpw.git", branch: "main"
  license "GPL-2.0-only"

  depends_on "openssl@3" => :build

  def install
    system "make", "OSSLPATH=#{HOMEBREW_PREFIX}/opt/openssl@3", "chntpw"
    bin.install "chntpw"
  end

  test do
    assert_match "chntpw 1.0.2,", shell_output("#{bin}/chntpw -h")
  end
end
