require 'yaml'

require_relative 'json_parser'
require_relative 'line_json_parser'
require_relative 'nested_json_parser'
require_relative 'row_xml_parser'

class Parser
  PARSERS =
    YAML
      .load_file(__dir__ + '/../config/parsers.yml')
      .transform_values { |class_name| (class_name + '_parser').camelize.constantize }

  def self.parse(file_with_path)
    parser = PARSERS[File.basename(file_with_path)]

    parser.new(file_with_path).parse
  end
end
