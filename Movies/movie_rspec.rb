require_relative './movie'

describe Movie do
  it 'should test if Movie can be achived' do
    movie = Movie.new('2012/02/08', silet: true)
    expect(movie.can_be_archived?).to eq true
  end
end
