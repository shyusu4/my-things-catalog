require_relative './source'

describe Source do
  it 'Should test name as a property' do
    source = Source.new('Japan')
    expect(source.name).to eq 'Japan'
  end
end
