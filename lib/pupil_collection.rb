class PupilCollection
  def initialize(array_of_pupils)
    @pupils = array_of_pupils
  end

  def average_scores
    scores =
      subjects.map! do |subject|
        [
          subject,
          @pupils.sum { |pupil| pupil.scores[subject] }.to_f / @pupils.count
        ]
      end

    scores.to_h
  end

  def subjects
    @pupils.flat_map(&:subjects).uniq
  end

  def bad_learning_fraction
    @pupils.count(&:bad_learning?).to_f / @pupils.count
  end
end
