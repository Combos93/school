require 'nokogiri'

class RowXmlParser
  ABBREVIATIONS = {
    'math' => 'mathematics',
    'rus' => 'russian_language',
    'phys' => 'physics'
  }.freeze

  def initialize(file)
    @data = Nokogiri::XML(File.read(file))
  end

  def parse
    @data.css('row').map do |row|
      name = row.at_css('name').text

      scores =
        row.css('grades').map do |grade|
          subject = ABBREVIATIONS[grade.at_css('subject').text]
          score = grade.at_css('score').text.to_i

          [subject, score]
        end

      scores = scores.to_h

      Pupil.new(name, scores)
    end
  end
end
