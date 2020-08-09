class Pupil
  attr_reader :scores

  def initialize(name, scores)
    @name = name
    @scores = scores
  end

  def subjects
    @scores.keys
  end

  def bad_learning?
    @scores.values.any? { |score| score <= 3 }
  end
end
