#tests
require './lib/bitmap_editor'

bitmapEditor = BitmapEditor.new   

describe '#run' do
end	

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