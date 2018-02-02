class BitmapEditor
  attr_reader :bitmap

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)
    File.open(file).each do |line|
      line = line.chomp  
      next if line == ""
      args = line.split(' ')
      p args
      if valid?(args)         
        case args[0]
        when 'I'       
          create(args[1].to_i, args[2].to_i)
        when 'C' 
          clear       
        when 'L'  
          colour(args[1].to_i, args[2].to_i, args[3])
        when 'V'  
          vertical(args[1].to_i, args[2].to_i, args[3].to_i, args[4])
        when 'H'
          horizontal(args[1].to_i, args[2].to_i, args[3].to_i, args[4])
        when 'S'       
            show         
        end
      else
        # need to change message based on reason for failure     
        puts "There is invalid input in the command: #{line}. Please fix and resubmit"  
        break 
      end 
       
    end
  end  

  def valid?(args)
    bitmapRows = @bitmap&.size || 0 
    bitmapCols = @bitmap&.first&.size || 0

    # this stores the valid values for the arguments for each command type
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
           :column => (1..bitmapCols).to_a,
           :row => (1..bitmapRows).to_a,           
           :colour => ('A'..'Z').to_a
        }, 
      'H'=> {
           :len => 5,           
           :startCol => (1..bitmapCols).to_a,
           :endCol => (1..bitmapCols).to_a,
           :row => (1..bitmapRows).to_a,
           :colour => ('A'..'Z').to_a
        }, 
      'V'=> {
           :len => 5,
           :column => (1..bitmapCols).to_a,
           :startRow => (1..bitmapRows).to_a,
           :endRow => (1..bitmapRows).to_a,
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
      p settings
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
     @bitmap.map! { |row| row.fill('O') }
     p @bitmap 
  end

  #Colours the pixel (X,Y) with colour C.
  def colour(x, y, c) 
    @bitmap[y-1][x-1] = c
    p @bitmap
  end
  
  #Draw vertical segment of col C in column X between rows Y1 and Y2 (incl).
  def vertical(x, y1, y2, c)
    (y1-1).upto(y2-1) do |num|
      @bitmap[num][x-1] = c
    end  
  end

  #Draw horizontal segment of col C in row Y between columns X1 and X2 (incl)
  def horizontal(x1, x2, y, c)
    (x1-1).upto(x2-1) do |num|
      @bitmap[y-1][num] = c
    end  
  end

  #Show the contents of the current image
  def show
    @bitmap.each { |row| puts row.join('') }
  end 

end

