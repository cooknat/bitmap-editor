#tests
require './lib/bitmap_editor'

describe "#create" do 
	it "creates a white bitmap of specified size" do
	    bitmapEditor = BitmapEditor.new    
		 bitmapEditor.create(3,4)
	    expect(bitmapEditor.bitmap).to eq([['O','O','O'],['O','O','O'],['O','O','O'],['O','O','O']]) 
	end
end