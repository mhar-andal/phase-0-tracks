
# RSpec
# 'describe' block for each group of tests  
  # 'it' block for each individual test
    # expect(<YOUR CODE>).to eq <RESULT>

require_relative 'wordguesser'

describe do
  let(:games) { WordGame.new("asd") }

  it "checks first guess" do
    expect(games.guess("a")).to eq("a__")
  end

  it "checks two guess's" do
    games.guess("a")
    expect(games.guess("s")).to eq("as_")
  end

  it "checks two guess's" do
    games.guess("a")
    games.guess("s")
    expect(games.guess("d")).to eq("asd")
  end

  it "checks if 3 guess's quits" do
    games.guess("a")
    games.guess("s")    
    games.guess("r")
    expect(games.checkGuess).to eq(true)
  end

end