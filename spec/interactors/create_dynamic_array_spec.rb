require 'rails_helper'

RSpec.describe CreateDynamicArray, type: :interactor do
  describe '.call' do
    context 'with valid params' do
      let(:params) { 10 }
      subject { CreateDynamicArray.call(length: params) }

      it 'should save DynamicArray when params are valid' do
        allow(CreateDynamicArray).to receive(:call!) { :success }
      end

      it 'should increase the amount of array in the database' do
        expect { subject }.to change { DynamicArray.count }.to(1)
      end

      it 'should returns a context with DynamicArray attribute' do
        expect(subject.array).to be_a_kind_of(DynamicArray)
      end

      it 'should save DynamicArray with a internal array of length equal to params' do
        expect(subject.array.internal_array.length).to eq(params)
      end
    end

    context 'with invalid params' do
      subject { CreateDynamicArray.call(length: 6) }

      it 'should not save DynamicArray when params are valid' do
        allow(CreateDynamicArray).to receive(:call!) { :failure }
      end

      it 'should be - the amount of dynamic array in the database' do
        subject
        expect(DynamicArray.count).to eq(0)
      end
    end
  end
end
