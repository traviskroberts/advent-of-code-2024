require_relative '../helper'

input = Helper.get_input
lines = input.split("\n")

results = lines.each_with_object([]) do |line, res|
  steps = line.split.map(&:to_i)
  dir = nil
  safe = true
  steps.each_cons(2) do |pair|
    next if !safe

    if pair.first == pair.last
      safe = false
      next
    end

    diff = (pair.first - pair.last).abs

    if diff == 0 || diff > 3
      safe = false
      next
    end

    if pair.first > pair.last
      if dir == :increasing
        safe = false
        next
      end

      dir = :decreasing
    end

    if pair.first < pair.last
      if dir == :decreasing
        safe = false
        next
      end

      dir = :increasing
    end

    safe = true
  end

  if safe
    res << 'y'
  end
end

puts results.size
