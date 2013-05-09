require 'formula'

class Chgems < Formula

  homepage 'https://github.com/postmodern/chgems#readme'
  url 'https://github.com/downloads/postmodern/chgems/chgems-0.3.1.tar.gz'
  sha1 '742f1d12e85d93f286472425618fceba3e01f67c'
  head 'https://github.com/postmodern/chgems.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

end
