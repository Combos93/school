require 'json'

class JsonParser
  def initialize(file)
    @data = JSON.parse(File.read(file))
  end
end
