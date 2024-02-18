require './lib/connect-four.rb'

describe '#connect-four' do
    describe "#initialize" do
    it "initializes the board correctly" do
      game = ConnectFour.new
      expect(game.instance_variable_get(:@board)).to eq(Array.new(6) { Array.new(7, "  ") })
    end
  end
end