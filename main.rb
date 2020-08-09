require 'active_support/core_ext/string/inflections.rb'

require_relative 'lib/pupil'
require_relative 'lib/pupil_collection'
require_relative 'lib/parser'

pupils = Dir.glob(__dir__ + '/data/*').flat_map { |file_name| Parser.parse(file_name) }

pupil_collection = PupilCollection.new(pupils)

average_scores = pupil_collection.average_scores
bad_learning_fraction = pupil_collection.bad_learning_fraction

puts 'Average Scores:'
puts average_scores.map { |k, v| "#{k}: #{v.round(2)}" }.join(', ')
puts "Bad-learning students percentage: #{(bad_learning_fraction * 100).round(2)}%"
