require 'formula'

class Chgems < Formula

  url 'https://github.com/downloads/postmodern/chgems/chgems-0.2.2.tar.gz'
  homepage 'https://github.com/postmodern/chgems#readme'
  md5 'fb4468b0e8c7b7fbc172df1902da4e30'
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
