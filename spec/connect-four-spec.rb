require './lib/connect-four.rb'

describe ConnectFour do
  subject(:game) { ConnectFour.new }

  describe '#initialize' do
    it 'initializes the board correctly' do
      expect(game.instance_variable_get(:@board)).to eq(Array.new(6) { Array.new(7, ' ') })
    end
  end

  describe '#player_win?' do
    context 'when there is a horizontal win' do
      it 'returns true' do

        allow(game).to receive(:find_lowest_empty_row).and_return(0, 1, 2, 3)
        game.instance_variable_set(:@board, [
          ['O', 'O', 'O', 'O', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ']
        ])

        expect(game.player_win?('O')).to eq(true)
      end
    end

    context 'when there is a vertical win' do
        it 'returns true' do
  
          allow(game).to receive(:find_lowest_empty_row).and_return(0, 0, 0, 0)
          game.instance_variable_set(:@board, [
            ['O', ' ', ' ', ' ', ' ', ' ', ' '],
            ['O', ' ', ' ', ' ', ' ', ' ', ' '],
            ['O', ' ', ' ', ' ', ' ', ' ', ' '],
            ['O', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' '],
            [' ', ' ', ' ', ' ', ' ', ' ', ' ']
          ])
  
          expect(game.player_win?('O')).to eq(true)
        end
      end
  end

  describe '#select_piece' do
    before do
      allow(game).to receive(:puts)
      allow(game).to receive(:gets).and_return("4\n")
    end

    it "places an 'O' in the bottom row of the selected column" do
      game.select_piece("O")
      bottom_row = game.instance_variable_get(:@board)[5]
      expect(bottom_row[3]).to eq('O')
    end

    it 'tokens stack up' do
      2.times { game.select_piece('O') }
      second_bottom_row = game.instance_variable_get(:@board)[4]
      expect(second_bottom_row[3]).to eq('O')
    end

    it "each player's token alternates" do
      game.round(number: 2)
      bottom_row = game.instance_variable_get(:@board)[5]
      expect(bottom_row[3]).to eq('O')
      second_bottom_row = game.instance_variable_get(:@board)[4]
      expect(second_bottom_row[3]).to eq('X')
    end
  end
end
