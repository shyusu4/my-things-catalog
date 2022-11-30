require_relative './movie'
describe Movie do
  it 'should test if Movie can be achived' do
    movie = Movie.new('2012/02/08', silet= true)
    expect(movie.published_date).to eq '2012/02/08'
    expect(movie.silet).to eq true
    expect(movie).to respond_to(:can_be_archived?)
  end
end
