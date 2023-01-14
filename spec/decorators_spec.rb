require 'spec_helper'

describe 'Tests for decorators' do
  context 'When testing decorator classes' do
    before :each do
      @person = Person.new(23, 45, 'john stiffen')
    end

    describe BaseDecorator do
      it 'should return the argument unchanged' do
        expect(@person.correct_name).to eq 'john stiffen'
      end
    end

    describe CapitalizeDecorator do
      it 'should return the argument Capitalized' do
        capital_decorator = CapitalizeDecorator.new(@person)
        expect(capital_decorator.correct_name).to eq 'John stiffen'
      end
    end

    describe TrimmerDecorator do
      it 'should return the argument trimmed' do
        trimmer_decorator = TrimmerDecorator.new(@person)
        expect(trimmer_decorator.correct_name).to eq 'john stiff'
      end
    end
  end
end
