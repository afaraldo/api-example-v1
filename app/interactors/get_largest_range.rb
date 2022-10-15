# frozen_string_literal: true

# To used to calculate a the largest range intro Array
class GetLargestRange
  include Interactor

  def call
    sorted_array = context.array.internal_array.sort
    ranges_array = generate_range(sorted_array)
    puts "#{ranges_array}"
    result = calculate_largest_range(ranges_array)
    puts "#{result}"
    context.range = result
  rescue StandardError => e
    context.fail!(error: e.message)
  end

  private

  def generate_range(array)
    array.each_with_object([]) do |num, sum|
      if sum.empty?
        sum.append([num])
      elsif sum.last.try(:last) == num - 1
        sum.last.append(num)
      else
        sum.append([num])
      end
    end
  end

  def calculate_largest_range(array)
    largest_range =array.reduce([]) do |result, range|
      result = range if range.length >= result.length
      result
    end
    [largest_range.first, largest_range.last]
  end
end
