require 'formula'

class Chgems < Formula

  homepage 'https://github.com/postmodern/chgems#readme'
  url 'https://github.com/downloads/postmodern/chgems/chgems-0.3.0.tar.gz'
  sha1 '91d825092dffef485def66a5f020497d1728921f'
  head 'https://github.com/postmodern/chgems.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

end
