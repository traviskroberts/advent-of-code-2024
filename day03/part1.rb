require_relative '../helper'

input = Helper.get_input
total = 0

input.scan(/(mul\(\d{1,3},\d{1,3}\))/).flatten.each do |mul|
  numbers = mul.scan(/(\d{1,3})/).flatten
  total += (numbers[0].to_i * numbers[1].to_i)
end

puts total
