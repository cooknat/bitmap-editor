#tests
require './lib/bitmap_editor'

bitmapEditor = BitmapEditor.new   

describe '#valid?' do
	it 'returns false if a line does not match its given regex' do
  	bitmapEditor.create(3,4)
 	  expect(bitmapEditor.valid?('L tiger * s')).to be_falsey
  end	   
end  

describe '#create' do 
	it 'creates a white bitmap of specified size' do	     
		 bitmapEditor.create(3,4)
	   expect(bitmapEditor.bitmap).to eq([['O','O','O','O'],['O','O','O','O'],['O','O','O','O']]) 
	end

	it 'shows an error message if the height or width are greater than 250' do
		message = bitmapEditor.create(260,220)
		expect(message).to eq('Please resubmit with M and N values less than or equal to 250')
	end	
end

describe '#colour' do
	it 'colours a specified pixel to the specified colour' do
    bitmapEditor.colour(1, 2, 'B')
    expect(bitmapEditor.bitmap[1][0]).to eq('B')
  end
end	

describe '#clear' do
	it 'sets all pixels to white' do
    bitmapEditor.colour(1, 2, 'B')
    bitmapEditor.clear
    expect(bitmapEditor.bitmap[1][0]).to eq('O')
  end
end	

describe '#show' do
	it 'outputs the bitmap to the console as a grid' do 
	  bitmapEditor.create(3,2) 
    expect{ bitmapEditor.show }. to output("OO\nOO\nOO\n").to_stdout
  end
end	

describe '#vertical' do
	it 'colours a vertical segment of colour C in column X between rows Y1 and Y2 (incl)' do
		bitmapEditor.create(5, 6)
    bitmapEditor.vertical(4, 3, 5, 'A')    
    segment = [bitmapEditor.bitmap[2][3], bitmapEditor.bitmap[3][3], bitmapEditor.bitmap[4][3]]
    expect(segment).to eq(['A', 'A', 'A'])    
  end
end	

describe '#horizontal' do
	it 'colours a horizontal segment of colour C in row Y between columns X1 and X2 (incl)' do
    bitmapEditor.create(5, 6)
    bitmapEditor.horizontal(1, 4, 5, 'R') 
    segment = [bitmapEditor.bitmap[4][0], bitmapEditor.bitmap[4][1], bitmapEditor.bitmap[4][2], bitmapEditor.bitmap[4][3]]       	
    expect(segment).to eq(['R', 'R', 'R', 'R'])   	
  end
end	
