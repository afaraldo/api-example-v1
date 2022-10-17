# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GetLargestRange, type: :interactor do
  describe '.call' do
    context 'with valid params' do
      let(:dynamic_array) { CreateDynamicArray.call(length: 15) }
      subject { GetLargestRange.call(array: dynamic_array.array) }

      it 'should save DynamicArray when params are valid' do
        allow(GetLargestRange).to receive(:call!) { :success }
      end

      it 'should returns a context with DynamicArray attribute' do
        expect(subject.range).to be_a_kind_of(Array)
      end
    end
  end
end
