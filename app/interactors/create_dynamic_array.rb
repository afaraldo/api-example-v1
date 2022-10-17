# frozen_string_literal: true

# To used to create a DynamicArray
class CreateDynamicArray
  include Interactor

  def call
    # Validate input
    raise ArgumentError, 'Required attribute lengt is missing' unless context.length

    set = Set.new
    size = context.length.to_i
    set.add(rand(0..size + 10)) while set.length < size # Used to generate the maximum of the range

    array = DynamicArray.new
    array.internal_array = set.to_a

    array.save!
    context.array = array
  rescue StandardError => e
    context.fail!(error: e.message)
  end
end
