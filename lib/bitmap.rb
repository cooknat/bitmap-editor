class Bitmap
	attr_accessor :cols, :rows, :image

  # represent bitmap with a two dimensional array
  def initialize(cols, rows)
  	@cols = cols
  	@rows = rows
  	@image = Array.new(rows){Array.new(cols, 'O')}   
  end	

end  