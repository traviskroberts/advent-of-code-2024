require_relative '../helper'

input = Helper.get_input

enabled = true
total = 0

input.scan(/(do\(\)|don't\(\)|mul\(\d{1,3},\d{1,3}\))/).flatten.each do |entry|
  if entry == "don't()"
    enabled = false
    next
  end

  if entry == "do()"
    enabled = true
    next
  end

  if enabled
    numbers = entry.scan(/(\d{1,3})/).flatten
    total += (numbers[0].to_i * numbers[1].to_i)
  end
end

puts total
