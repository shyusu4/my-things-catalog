require_relative '../Movies/movie'

describe Movie do
  let(:movie) { Movie.new('2012/02/08', true) }
  context 'when creating a new movie' do
    it 'should have a publish date' do
      expect(movie.published_date).to eq '2012/02/08'
    end
    it 'should have a digital' do
      expect(movie.silet).to eq true
    end
    it 'have can_be_archived?' do
      expect(movie).to respond_to(:can_be_archived?)
    end
  end
end
