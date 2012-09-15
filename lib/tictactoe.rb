class Board
  def initialize
    @grid = Hash.new
    (1..3).each do |i|
      (1..3).each do |j|
        @grid[ [i,j] ] = ''
      end
    end
  end

  def move(row, column, piece)
    unless (1..3) === row && (1..3) === column
      raise ArgumentError, "Row and column must be integers between 1 and 3."
    end
    unless ['o', 'x'].include? piece
      raise ArgumentError, "Piece must be 'o' or 'x'."
    end
    unless @grid[ [row, column] ].empty?
      raise RuntimeError, "Space must be unoccupied."
    end
    @grid[ [row, column] ] = piece
  end

  def display
    (1..3).each do |i|
      (1..3).each do |j|
        case @grid[ [i,j] ]
        when '' then print '*'
        end
      end
      print "\n"
    end
  end

  def to_s
    puts @grid
  end
end
