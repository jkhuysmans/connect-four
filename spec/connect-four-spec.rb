require './lib/connect-four.rb'

describe '#connect-four' do

subject(:game) { ConnectFour.new }

    describe "#initialize" do
        it "initializes the board correctly" do
            expect(game.instance_variable_get(:@board)).to eq(Array.new(6) { Array.new(7, " ") })
        end
    end

    describe "#select_piece" do
        before do
            allow(game).to receive(:puts)
            allow(game).to receive(:gets).and_return("4\n") 
        end

        it "places a 'O' in the bottom row of the selected column" do
            game.select_piece("O")
            bottom_row = game.instance_variable_get(:@board)[5]
            expect(bottom_row[3]).to eq("O")
        end

        it "Tokens stack up" do
            allow(game).to receive(:gets).and_return("4\n")
            2.times do game.select_piece("O")
            end
            second_bottom_row = game.instance_variable_get(:@board)[4]
            expect(second_bottom_row[3]).to eq("O")
        end

        it "Each players' token alternate" do
            allow(game).to receive(:gets).and_return("4\n")
            game.round(number: 2)

            bottom_row = game.instance_variable_get(:@board)[5]
            expect(bottom_row[3]).to eq("O")
            second_bottom_row = game.instance_variable_get(:@board)[4]
            expect(second_bottom_row[3]).to eq("X")
        end


    end
end