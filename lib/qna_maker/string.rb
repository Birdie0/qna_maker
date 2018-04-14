require 'htmlentities'

CODER = HTMLEntities.new

#
# Monkey-patched String method for fixing responses.
#
class String
  #
  # Fixes &lt;, &amp; and other &'s characters, replaces crlf to lf newlines.
  #
  # @return [String] same text with correctly displayed &xxxx; characters and lf newlines.
  #
  def normalize
    CODER.decode(self).gsub(/\r\n?/, "\n")
  end
end
