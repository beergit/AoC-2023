require_relative '../Advent'
class Advent4 

  def initialize(input)
    @scratchcards = input.each_line(chomp: true).map do |line|
     sc = line.split(/[:|]/)
     [1, (sc[1].split & sc[2].split).size]
   end
  end

  def part1
    @scratchcards.sum{|sc| (2**(sc[1]- 1)).to_i}
  end

  def part2
    @scratchcards.each_index{|idx| (idx + 1).upto(idx + @scratchcards[idx][1]){|t| @scratchcards[t][0] += @scratchcards[idx][0]}}
    @scratchcards.sum{|sc| sc[0]}
  end 
end
