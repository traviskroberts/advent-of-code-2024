require_relative '../helper'

def all_increasing?(steps)
  steps.each_cons(2).all? { |first, second| first < second }
end

def all_decreasing?(steps)
  steps.each_cons(2).all? { |first, second| first > second }
end

def acceptable_diffs?(steps)
  steps.each_cons(2).all? do |first, second|
    diff = (first - second).abs
    diff > 0 && diff < 4
  end
end

def safe?(steps)
  (all_increasing?(steps) || all_decreasing?(steps)) && acceptable_diffs?(steps)
end

def safe_removing_step?(steps)
  steps.each_index do |i|
    new_steps = steps.dup
    new_steps.delete_at(i)
    return true if safe?(new_steps)
  end
  false
end

input = Helper.get_input
lines = input.split("\n")
total = 0

lines.each do |line|
  steps = line.split.map(&:to_i)

  if safe?(steps) || safe_removing_step?(steps)
    total += 1
  end
end

puts total
