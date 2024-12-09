require_relative '../helper'

input = Helper.get_input
a, b = input.split("\n").map(&:split).transpose.each(&:sort!)

diffs = a.zip(b).map do |one, two|
  (two.to_i - one.to_i).abs
end

puts diffs.sum
