require 'formula'

class Chgems < Formula

  url 'https://github.com/downloads/postmodern/chgems/chgems-0.2.0.tar.gz'
  homepage 'https://github.com/postmodern/chgems#readme'
  md5 '7ea27db471646a2b43f41dfbcadcc55f'
  head 'https://github.com/postmodern/chgems.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

end
