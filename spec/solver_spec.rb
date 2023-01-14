require_relative 'solver'

RSpec.describe Solver do
  context 'Factorial' do
    it 'Test : Factorial of a number' do
      result = Solver.new
      expect(result.factorial(0)).to eq(1)
      expect(result.factorial(1)).to eq 1
      expect(result.factorial(2)).to eq 2
      expect(result.factorial(3)).to eq(6)
      expect(result.factorial(-2)).to eq('No negative number')
    end
  end 
end