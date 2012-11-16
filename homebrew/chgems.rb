require 'formula'

class Chgems < Formula

  url 'https://github.com/downloads/postmodern/chgems/chgems-0.2.3.tar.gz'
  homepage 'https://github.com/postmodern/chgems#readme'
  md5 'aed67b00aedeb9bcddf7b6f1df8d3d30'
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
