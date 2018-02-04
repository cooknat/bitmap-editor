require_relative './bitmap'

class BitmapEditor
  attr_reader :bitmap

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)    
    File.open(file).each do |line|
      #skip empty lines
      next if line == ""  || line == "\n"  
      #exit if the user attempts commands other than 'I' before 'I' has been run
      return puts "please create a bitmap using command 'I' before running other commands." if @bitmap.nil? && line[0] != 'I' 
      line = line.chomp.strip       
      args = line.split(' ')    
      if valid?(line)         
        case line[0]
        when 'I'       
          if args[1].to_i <= 250 && args[2].to_i <= 250 
            create(args[1].to_i, args[2].to_i)                  
          else
            puts 'Please resubmit with M and N values less than or equal to 250'
            break 
          end           
        when 'C' 
          clear       
        when 'L' 
          if args[1].to_i <= @bitmap.cols && args[2].to_i <= @bitmap.rows
            colour(args[1].to_i, args[2].to_i, args[3])
          else  
            puts "You are trying to colour outside the lines, this command: #{line} - will be skipped."  
          end
        when 'V'
          if args[1].to_i <= @bitmap.cols && args[2].to_i <= @bitmap.rows && args[3].to_i <= @bitmap.rows  
            vertical(args[1].to_i, args[2].to_i, args[3].to_i, args[4])
          else  
            puts "You are trying to colour outside the lines, this command: #{line} - will be skipped."  
          end  
        when 'H'
          if args[1].to_i <= @bitmap.cols && args[2].to_i <= @bitmap.cols && args[3].to_i <= @bitmap.rows
            horizontal(args[1].to_i, args[2].to_i, args[3].to_i, args[4])
          else  
            puts "You are trying to colour outside the lines, this command: #{line} - will be skipped."  
          end  
        when 'S'       
            show         
        end
      else  
        puts "The command: #{line} contains invalid commands or an incorrect number of arguments, it will be skipped."        
      end        
    end
  end  

  def valid?(line)
    case line[0]
    when 'I'       
      /\A[I]\s\b[0-9]{1,3}\b\s\b[0-9]{1,3}\b\z/.match(line) != nil
    when 'C' 
      /\A[C]\z/.match(line) != nil 
    when 'L'  
      /\A[L]\s\b[0-9]{1,3}\b\s\b[0-9]{1,3}\b\s[A-Z]\z/.match(line) != nil
    when 'V' 
      /\A[V]\s\b[0-9]{1,3}\b\s\b[0-9]{1,3}\b\s\b[0-9]{1,3}\b\s[A-Z]\z/.match(line) != nil
    when 'H'
      /\A[H]\s\b[0-9]{1,3}\b\s\b[0-9]{1,3}\b\s\b[0-9]{1,3}\b\s[A-Z]\z/.match(line) != nil
    when 'S'       
      /\A[S]\z/.match(line) != nil    
    else
      false
    end 
  end 
  
  def create(cols, rows)
    @bitmap = Bitmap.new(cols, rows)           
  end 

  # set all pixels to white
  def clear
     @bitmap.image.map! { |row| row.fill('O') }   
  end

  #Colours the pixel (X,Y) with colour C.
  def colour(x, y, c)         
    @bitmap.image[y-1][x-1] = c      
  end
  
  #Draw vertical segment of col C in column X between rows Y1 and Y2 (incl).
  def vertical(x, y1, y2, c)    
    ([y1-1,y2-1].min).upto([y1-1,y2-1].max) do |num|      
      @bitmap.image[num][x-1] = c
    end    
  end

  #Draw horizontal segment of col C in row Y between columns X1 and X2 (incl)
  def horizontal(x1, x2, y, c)    
    ([x1-1,x2-1].min).upto([x1-1,x2-1].max) do |num|
      @bitmap.image[y-1][num] = c
    end   
  end

  #Show the contents of the current image
  def show
    @bitmap.image.each { |row| puts row.join('') }
  end 

end

