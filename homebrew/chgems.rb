require 'formula'

class Chgems < Formula

  url 'https://github.com/downloads/postmodern/chgems/chgems-0.2.1.tar.gz'
  homepage 'https://github.com/postmodern/chgems#readme'
  md5 'a2a87d44e1bc00c1ddfc0053e1908774'
  head 'https://github.com/postmodern/chgems.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

  def caveats; <<-EOS.undent
    Add chgems to ~/.bashrc or ~/.profile:

      . #{prefix}/share/chgems/chgems.sh

    For system-wide installation, add the above text /etc/profile.

    EOS
  end

end
