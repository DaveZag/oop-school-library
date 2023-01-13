require 'spec_helper'

describe Classroom do
  context 'Testing the Classroom class after taking an argument' do
    before :each do
      @classroom = Classroom.new('Biology')
    end

    it 'should create a Classroom instance properly' do
      expect(@classroom).to be_instance_of Classroom
    end

    it 'should return the correct classroom label' do
      expect(@classroom.label).to eq 'Biology'
    end

    it 'should have a students variable which is an array' do
      expect(@classroom.students).to be_an Array
    end

    it 'should add a student properly' do
      student = Student.new(23, 'Diston Tebele', true)
      @classroom.add_student(student)

      expect(@classroom.students).to eq([student])
    end
  end
end
