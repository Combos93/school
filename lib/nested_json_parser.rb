class NestedJsonParser < JsonParser
  def parse
    names =
      @data.flat_map do |subject, students|
        students.map { |student| student['student'] }
      end
    names.uniq!

    subjects = @data.keys

    names.map do |name|
      scores =
        subjects.map do |subject|
          [
            subject,
            @data[subject].find { |x| x['student'] == name }['grade']
          ]
        end

      scores = scores.to_h

      Pupil.new(name, scores)
    end
  end
end
