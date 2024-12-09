require_relative '../helper'

input = Helper.get_input
a, b = input.split("\n").map(&:split).transpose

counts = a.map { |el| el.to_i * b.count(el) }

puts counts.sum
