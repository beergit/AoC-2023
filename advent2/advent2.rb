class Advent2
  def initialize(input)
    @input = input
  end

  def part1
    regexp = Regexp.new([[3, 'red'], [4, 'green'], [5, 'blue']].map{|v| "(((1[%d-9])|([2-9]\\d+))\\s+%s)" % v}.join('|'))
    @input.each_line(chomp: true).reject{|line| regexp.match? line}.sum{|g| g.match(/Game\s+(\d+)/)[1].to_i}
  end
  
  def part2
    px = @input.each_line(chomp: true).sum do |line|
      sx = line.split(/[;:]/)[1..]
      %w(red green blue).map do |c|
        regexp = Regexp.new("(\\d+)\\s+#{c}")
        sx.max{|a,b| (regexp.match?(a) ? regexp.match(a)[1].to_i : 0) <=> (regexp.match?(b) ? regexp.match(b)[1].to_i : 0)}.match(regexp)[1].to_i
      end.inject(:*)
    end
  end  
end
