Surround = [ [-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]]

class Advent3

  def initialize(input)
    @engine = input.each_line(chomp: true).map{|line| line.chars}
    @dim_col = (0...@engine[0].size)
    @dim_row = (0...@engine.size)
    @sum = 0
    @gears = {}
  end

  def part1
    scan
    @sum
  end

  def part2
    scan
    @gears.values.select{|v| v.size == 2}.sum{|g| g[0]*g[1]}
  end 

private
  def adjected?(row, col)
    Surround.any?{|sx| @dim_col.include?(col + sx[1]) and @dim_row.include?(row + sx[0]) and /[^\.0-9]/.match?(@engine[row + sx[0]][col + sx[1]])}
  end

  def gear(row, col)
    Surround.select{|sx| @dim_col.include?(col + sx[1]) and @dim_row.include?(row + sx[0]) and @engine[row + sx[0]][col + sx[1]] == '*'}.map{|sx| [row + sx[0], col + sx[1]]}
  end

  def continued?(row, col)
    col + 1 <= @dim_col.last and @engine[row][col + 1] =~ /\d/
  end

  def scan
    @dim_row.each do |row|
      num = []
      gear = []
      valid = false
      @dim_col.each do |col|
        if(@engine[row][col] =~ /\d/)
          valid = adjected?(row, col) unless valid
          gear = gear(row, col) if gear.empty?
          num << @engine[row][col]
          unless continued?(row, col)
            @sum += num.join.to_i if valid
            unless gear.empty?
              @gears[gear] ||= []
              @gears[gear] << num.join.to_i
              gear = []
            end
            num = []
            valid = false
          end  
        end      
      end    
    end
  end

end
