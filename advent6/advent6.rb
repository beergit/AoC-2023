class Advent6 

  def initialize(input)
    @races = []
    lines = input.each_line(chomp: true).to_a.map{|line| line.split(':')[1]}.map(&:split).map{|m| m.map(&:to_i)}
    lines[0].each_index{|idx| @races << {:time => lines[0][idx], :distance => lines[1][idx]}} 
  end

  def part1
    @races.map{|r| (r[:time] + 1).times.select{|t| (r[:time] - t)*t > r[:distance]}.size}.inject(:*)
  end

  def part2
    t = @races.map{|r| r[:time]}.join.to_f
    d = @races.map{|r| r[:distance]}.join.to_f
    Math.sqrt(t**2-4.0*d).to_i
  end 
end
