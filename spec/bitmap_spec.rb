require './lib/bitmap'

bitmap = Bitmap.new(6, 4)   

describe '#valid?' do
  it 'sets the columns equal to the supplied argument' do  	
 	  expect(bitmap.cols).to eq(6)
  end	
  it 'sets the rows equal to the supplied argument' do  	
 	  expect(bitmap.rows).to eq(4)
  end   
end 