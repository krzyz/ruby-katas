class Board
  def initialize
    @grid = Hash.new
    (1..3).each do |i|
      (1..3).each do |j|
        @grid[ [i,j] ] = 0
      end
    end
  end

  def to_s
    puts @grid
  end
end
