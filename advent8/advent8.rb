class Advent8
  def initialize(input)
    @nodes = {}
    input.each_line(chomp: true) do |line|
      @moves = line.chars.map(&:to_sym) if line =~ /^[LR]+$/
      @nodes[$1.to_sym] = {:L => $2.to_sym, :R => $3.to_sym} if line =~ /(\w+)\s+=\s+\((\w+),\s+(\w+)\)/
    end

  end
  def part1
    doit(/AAA/, /ZZZ/)
  end
  def part2
    doit(/\w\wA/, /\w\wZ/)
  end

  private
  def doit(start, stop)
    node = @nodes.keys.select{|n| n.to_s =~ start}
    move = 0
    idx = 0
    last_z = Array.new(node.size, 0)
    while last_z.any?{|z| z == 0}
      node.each_index.select{|idx| node[idx].to_s =~ stop and last_z[idx] == 0}.each{|idx| last_z[idx] = move}
      move += 1
      node.map!{|nd| @nodes[nd][@moves[idx]]}
      idx = (idx + 1) % @moves.size
    end
    last_z.reduce(1, :lcm)
  end
end
