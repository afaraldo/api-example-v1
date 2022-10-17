# frozen_string_literal: true

class DynamicArray < ApplicationRecord
  serialize :internal_array, Array

  validates_length_of :internal_array, minimum: 10, on: :create
end
