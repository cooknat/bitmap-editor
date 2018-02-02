#tests
require './lib/bitmap_editor'

bitmapEditor = BitmapEditor.new   

describe '#valid?' do
	it 'returns false if the argument array is the wrong size' do	
	  expect(bitmapEditor.valid?(['V', 3, 4, 'G'])).to be_falsey
	end	

  it 'returns false if any of the arguments are not integers or single letters' do
 	  expect(bitmapEditor.valid?(['L', 'tiger', '*', 's'])).to be_falsey
  end	   

  it 'returns false if the specified pixels are not within the bounds of the bitmap' do
		bitmapEditor.create(3,4)
		expect(bitmapEditor.valid?(['H', 8, 8, 8, 'P'])).to be_falsey
	end	

	it 'returns true if the specified pixels are within the bounds of the bitmap' do
		bitmapEditor.create(3,4)
		expect(bitmapEditor.valid?(['H', 1, 2, 3, 'P'])).to be_truthy
	end	
end  

describe '#create' do 
	it 'creates a white bitmap of specified size' do	     
		 bitmapEditor.create(3,4)
	    expect(bitmapEditor.bitmap).to eq([['O','O','O','O'],['O','O','O','O'],['O','O','O','O']]) 
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
