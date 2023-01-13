require 'spec_helper'

describe Student do
  context 'Testing the Student class after taking 3 arguments' do
    before :each do
      @student = Student.new(23, 'Daka Bilylo', true)
    end

    it 'should create a Student instance properly' do
      expect(@student.class).to eq Student
    end

    it 'should validate student name' do
      expect(@student.name).to eq 'Daka Bilylo'
    end

    it 'should add a classroom to student' do
      classroom = Classroom.new('Geography')
      @student.classroom = classroom
      expect(@student.classroom.label).to eq 'Geography'
    end

    it 'should return ¯\\(ツ)/¯ for the play_hooky method' do
      expect(@student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
