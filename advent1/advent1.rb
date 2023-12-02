Digits = %w(\d one two three four five six seven eight nine)
  
class Advent1
  def initialize(input)
    @calibration = input.each_line(chomp: true)
  end

  def part1
    @calibration.map { |cal| (cal[cal.index(/\d/)] + cal[cal.rindex(/\d/)]).to_i}.sum
  end
  
  def part2
    regexp = Regexp.new Digits.join '|'
    @calibration.map do |cal|
      [:index, :rindex].map do |meth|
        d1 = cal[cal.send(meth, regexp)..][regexp]
        d1 =~ /\d/ ? d1 : Digits.index(d1).to_s
      end.join.to_i
    end.sum
  end
end 
