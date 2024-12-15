require_relative '../helper'

class Day5
  def initialize
    @input = Helper.get_input
    @instructions, @page_lists = @input.split("\n\n").map { |item| item.split("\n") }
    @page_lists = @page_lists.map { |list| list.split(',') }
    @valid_pages = []
    @middle_pages = []
  end

  def call
    filter_pages
    get_middle_pages

    puts @middle_pages.sum
  end

  private

  def filter_pages
    @page_lists.each do |page_list|
      if list_is_valid?(page_list)
        @valid_pages << page_list
      end
    end
  end

  def list_is_valid?(pages)
    pages.each_with_index do |page, i|
      next if i.zero?

      instructions = matched_instructions_for(page)
      last_instructions = instructions.map do |instruction|
        instruction.split('|').last
      end

      violations = (0...i).any? do |page_index|
        last_instructions.include?(pages[page_index])
      end

      if violations
        return false
      end
    end

    return true
  end

  def matched_instructions_for(page)
    @instructions.select do |instruction|
      instruction.split('|').first == page.to_s
    end
  end

  def get_middle_pages
    @middle_pages = @valid_pages.map do |page_list|
      middle_index = page_list.length / 2
      page_list[middle_index].to_i
    end
  end
end

Day5.new.call
