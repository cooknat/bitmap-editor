class BitmapEditor
  attr_reader :bitmap

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      args = line.split(' ')   
      case args[0]
      when 'I'       
        create(args[1].to_i,args[2].to_i)
      when 'C'
      when 'L'  
      when 'V'  
      when 'H'
      when 'S'
          puts "There is no image"
      else
          puts 'unrecognised command :('
      end
    end
  end
  
  # represent bitmap with a two dimensional array
  def create(m, n)
   @bitmap = Array.new(n){Array.new(m, 'O')}     
  end 

  # set all pixels to white
  def clear
  end

  #Colours the pixel (X,Y) with colour C.
  def colour(x, y, c) 
  end
  
  #Draw vertical segment of col C in column X between rows Y1 and Y2 (incl).
  def vertical(x, y1, y2, c)
  end

  #Draw horizontal segment of col C in row Y between columns X1 and X2 (incl)
  def horizontal(x1, x2, y, c)
  end

  #Show the contents of the current image
  def show
  end 

end
