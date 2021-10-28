class Chntpw < Formula

    desc "The Offline NT Password Editor"
    homepage "https://github.com/minacle/chntpw"
    url "https://github.com/minacle/chntpw/archive/refs/tags/chntpw/1.0.1.tar.gz"
    sha256 "474b99bc2bd524e9012d5d038497011028886fdc4582f70ad88546ff216483ee"
    head "https://github.com/minacle/chntpw"
    license "GPL-2.0-only"
    depends_on "openssl@1.1" => :build

    def install
        system "make",  "OSSLPATH=#{HOMEBREW_PREFIX}/opt/openssl@1.1", "chntpw"
        bin.install "chntpw"
    end

    def test
        assert_match "chntpw 1.0.1,", shell_output("#{bin}/chntpw -h")
    end
end
