class Bob
  attr_reader :paints

  def initialize
    @paints = []
  end

  def add_paint(paint)
    @paints << paint
  end

  def paint_colors
    @paints.map {|obj| obj.name}
  end

  def total_paint_amount
    @paints.sum {|paint| paint.amount}
  end
end
