require 'htmlentities'

CODER = HTMLEntities.new

class String
  def normalize
    CODER.decode(self).gsub(/\r\n?/, "\n")
  end
end
