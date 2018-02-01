#tests
require './lib/bitmap_editor'

bitmapEditor = BitmapEditor.new   

describe '#run' do
end	

describe '#create' do 
	it 'creates a white bitmap of specified size' do	     
		 bitmapEditor.create(3,4)
	    expect(bitmapEditor.bitmap).to eq([['O','O','O'],['O','O','O'],['O','O','O'],['O','O','O']]) 
	end
end

describe '#colour' do
	it 'colours a specified pixel to the specified colour' do
    bitmapEditor.colour(1, 2, 'B')
    expect(bitmapEditor.bitmap[1][0]).to eq('B')
  end
end	