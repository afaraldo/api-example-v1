# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DynamicArray, type: :model do
  describe 'validations' do
    it { should serialize(:internal_array).as(Array) }
  end
end
