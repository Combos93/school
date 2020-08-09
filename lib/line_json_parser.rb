class LineJsonParser < JsonParser
  ABBREVIATIONS = {
    'math' => 'mathematics',
    'rus' => 'russian_language',
    'phys' => 'physics'
  }.freeze

  def parse
    @data.map do |line|
      name = line['name']

      scores = {}
      ABBREVIATIONS.each do |abbr, full_name|
        scores[full_name] = line[abbr]
      end

      Pupil.new(name, scores)
    end
  end
end
