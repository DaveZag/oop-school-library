require 'spec_helper'

describe Teacher do
  context 'Testing the Teacher class after taking 3 arguments' do
    before :each do
      @teacher = Teacher.new('Biology', 35, 'John Dante')
    end

    it 'should create a Teacher instance properly' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'should validate teacher name' do
      expect(@teacher.name).to eq 'John Dante'
    end

    it 'should validate teacher specialization' do
      expect(@teacher.specialization).to eq 'Biology'
    end

    it 'should return true for the can_us_services? method' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
