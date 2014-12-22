require 'spec_helper'
require 'mastermind/console'

#Mock?
require 'stringio'

describe Mastermind::Console do

  #let(:mock_io) {MockIO.new}
  #let(:console) {described_class.new(mock_io)}

  let(:console) { described_class.new }

  #let(:user_input)

  def capture_input
    $stdin.gets.chomp
  end


  #overwrite StringIO? for each do
  # - a new StringIO per test gives you
  # an isolated standard output
  # mock to test against
  before do
    $stdout = StringIO.new #assign a new StringIO instance to var stdout

  end
  after(:all) do
    $stdout = STDOUT

  end


=begin
  it '' do
    console.io.outputs
  end
=end


  it 'puts to console Welcome to Mastermind' do
    console.put_welcome
    expect($stdout.string).to match("Welcome to Mastermind")
  end

  it 'puts to console message: secret code generated' do
    console.put_secret_code_generated
    expect($stdout.string).to match("#{@secret_code}")
  end

  it 'puts directions to console' do
    console.put_directions
    expect($stdout.string).to match("Guess a code of 4 from colors | Red Yellow Blue Green Black White |, 8 tries to win.")
  end

  it 'puts prompt for Enter color for input' do
    console.put_prompt(1)
    expect($stdout.string).to match("Enter color 1")
  end
=begin
  it 'receive_input gets input' do
    console.receive_input([],0)
    user_input = "Red"
    expect(console.receive_input.guess).to match_array(["Red"])
  end
=end

  #setup - test more
  it 'makes new Mastermind::CodeMaker object and assigns to code_maker in setup' do
    expect{console.setup}.not_to raise_error
  end


  it 'end_of_game starts false in setup' do
    console.setup
    expect(console.end_of_game).to be false
  end

  it 'current_guess is  0 in setup' do
    console.setup
    expect(console.current_guess).to eq(0)
  end

  it 'puts to console secret code' do
    console.put_secret_code
    expect($stdout.string).to match("#{@secret_code}")
  end





=begin
  it 'each guess is 4 elements' do
    console.receive_input(["Red","Red","Red","Red"])
    console.guess
  end


  #Maybe you can move everything inside the while except the sleep to another method, then you write specs only for that method



  it 'setup assigns secret_code for game' do
    console.setup
    expect(@secret_code).not_to be_empty #calls [].empty?
  end
=end









end