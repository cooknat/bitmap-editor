class BitmapEditor
  attr_reader :bitmap

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp       
      args = line.split(' ')
      p args
      if valid?(args)         
        case args[0]
        when 'I'       
          create(args[1].to_i, args[2].to_i)
        when 'C'        
        when 'L'  
          colour(args[1].to_i, args[2].to_i, args[3])
        when 'V'  
        when 'H'
        when 'S'       
            puts "There is no image"
            break
        else
            puts 'unrecognised command :('
            break
        end
      else
        # need to change message based on reason for failure
        puts "There is invalid input in the command:  #{line} - please fix and resubmit."  
        break
      end 
       
    end
  end  

  def valid?(args)
    if @bitmap == nil && args[0] != 'I'
      p "You need to create a bitmap before you can manipulate it. Please ensure the first line is an 'I' command."
      return false
    end  

    #bitmapRows = @bitmap[0].size-1 ||= 0
    #bitmapCols = @bitmap.size-1 ||= 0

    if @bitmap != nil
      bitmapRows = @bitmap[0].size-1 
      bitmapCols = @bitmap.size-1 
    else
      bitmapRows = 0
      bitmapCols = 0
    end  

    lookup = {
      'I'=> {
           :len => 3,
           :rows => (1..250).to_a,
           :columns => (1..250).to_a
        }, 
      'C'=> {
           :len => 1
        },
      'L'=> {
           :len => 4,
           :column => (0..bitmapCols).to_a,
           :row => (0..bitmapRows).to_a,           
           :colour => ('A'..'Z').to_a
        }, 
      'H'=> {
           :len => 5,           
           :startCol => (0..bitmapCols).to_a,
           :endCol => (0..bitmapCols).to_a,
           :row => (0..bitmapRows).to_a,
           :colour => ('A'..'Z').to_a
        }, 
      'V'=> {
           :len => 5,
           :column => (0..bitmapCols).to_a,
           :startRow => (0..bitmapRows).to_a,
           :endRow => (0..bitmapRows).to_a,
           :colour => ('A'..'Z').to_a
        },       
      'S'=> {
           :len => 1
      }
    }

    settings = lookup[args[0]]   

    case args[0]
    when 'I'  
      settings[:len] == args.length &&
      settings[:rows].include?(args[1].to_i) &&
      settings[:columns].include?(args[2].to_i)            
    when 'L' 
      settings[:len] == args.length &&
      settings[:column].include?(args[1].to_i) &&
      settings[:row].include?(args[2].to_i) &&    
      settings[:colour].include?(args[3])             
    when 'H' 
      settings[:len] == args.length &&
      settings[:startCol].include?(args[1].to_i) &&
      settings[:endCol].include?(args[2].to_i) &&
      settings[:row].include?(args[3].to_i) &&    
      settings[:colour].include?(args[4])            
    when 'V'
      settings[:len] == args.length &&
      settings[:column].include?(args[1].to_i) &&
      settings[:startRow].include?(args[2].to_i) &&
      settings[:endRow].include?(args[3].to_i) &&    
      settings[:colour].include?(args[4])     
    when 'S'
      settings[:len] == args.length         
    when 'C'
      settings[:len] == args.length              
    end            
        
  end  

 
  # represent bitmap with a two dimensional array
  def create(rows, cols)
   @bitmap = Array.new(rows){Array.new(cols, 'O')}    
   p @bitmap
  end 

  # set all pixels to white
  def clear
  end

  #Colours the pixel (X,Y) with colour C.
  def colour(x, y, c) 
    @bitmap[y-1][x-1] = c
    p @bitmap
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

